import 'package:flutter/material.dart';

import '../app_theme.dart';

class DiarioPessoalScreen extends StatefulWidget {
  const DiarioPessoalScreen({super.key});

  @override
  State<DiarioPessoalScreen> createState() => _DiarioPessoalScreenState();
}

class _DiarioPessoalScreenState extends State<DiarioPessoalScreen> {
  final TextEditingController _notaController = TextEditingController();

  DateTime _dataSelecionada = DateTime(2023, 10, 24);

  final Map<DateTime, List<_RegistroDiario>> _registrosPorData = {
    DateTime(2023, 10, 22): const [
      _RegistroDiario(
        horario: '08:10',
        texto:
            'Comecei a semana revisando widgets basicos e ajustando meu cronograma.',
      ),
    ],
    DateTime(2023, 10, 24): const [
      _RegistroDiario(
        horario: '09:45',
        texto:
            'Hoje comecei o dia com uma meditacao guiada. Senti-me muito mais focado para as aulas de Flutter.',
      ),
      _RegistroDiario(
        horario: '14:20',
        texto:
            'Consegui finalizar o desafio do componente de calendario! A logica de estados foi um pouco complexa mas valeu a pena.',
      ),
    ],
    DateTime(2023, 10, 26): const [
      _RegistroDiario(
        horario: '11:30',
        texto: 'Anotei ideias para melhorar o layout da tela de exercicios.',
      ),
      _RegistroDiario(
        horario: '20:05',
        texto: 'Fechei o dia estudando navegacao e organizacao de componentes.',
      ),
    ],
  };

  @override
  void dispose() {
    _notaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;
    final diaSelecionado = _dataSelecionada.day;
    final chaveSelecionada = _normalizarData(_dataSelecionada);
    final registrosMes = _registrosPorData.entries
        .where((entrada) => _mesAnoIguais(entrada.key, _dataSelecionada))
        .fold<int>(
      0,
      (total, entrada) => total + entrada.value.length,
    );
    final diasComEntrada = _registrosPorData.entries
        .where((entrada) => _mesAnoIguais(entrada.key, _dataSelecionada))
        .map((entrada) => entrada.key.day)
        .toSet();
    final registrosSelecionados = _registrosPorData[chaveSelecionada] ?? const [];

    return Scaffold(
      backgroundColor: palette.background,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF10131A), Color(0xFF050608)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              spacing.md,
              spacing.sm,
              spacing.md,
              spacing.xl + 72,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TopBar(onBack: () => Navigator.of(context).pop()),
                SizedBox(height: spacing.md),
                _CalendarioCard(
                  mesTitulo:
                      '${_nomeMes(_dataSelecionada.month)} ${_dataSelecionada.year}',
                  entradasMes: '$registrosMes entradas este mes',
                  diaSelecionado: diaSelecionado,
                  mesSelecionado: _dataSelecionada,
                  diasComEntrada: diasComEntrada,
                  onSelectDia: (dia) => setState(
                    () => _dataSelecionada = DateTime(
                      _dataSelecionada.year,
                      _dataSelecionada.month,
                      dia,
                    ),
                  ),
                  onMesAnterior: _voltarMes,
                  onMesSeguinte: _avancarMes,
                  onAbrirCalendario: _abrirCalendario,
                ),
                SizedBox(height: spacing.md),
                _DataSelecionadaHeader(dataSelecionada: _dataSelecionada),
                SizedBox(height: spacing.sm + spacing.xs),
                _AreaEscritaCard(
                  controller: _notaController,
                  onSalvar: _salvarNota,
                ),
                SizedBox(height: spacing.md),
                Divider(
                  color: palette.divider.withValues(alpha: 0.8),
                  height: 1,
                ),
                SizedBox(height: spacing.md),
                Text(
                  'Registros Anteriores',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: spacing.sm + spacing.xs),
                if (registrosSelecionados.isEmpty)
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(spacing.md),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10141B),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: palette.divider),
                    ),
                    child: Text(
                      'Nenhum registro para este dia.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                else
                  ...registrosSelecionados.map(
                    (registro) => Padding(
                      padding: EdgeInsets.only(bottom: spacing.sm + 2),
                      child: _RegistroCard(registro: registro),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _salvarNota() {
    final texto = _notaController.text.trim();
    if (texto.isEmpty) {
      return;
    }

    final agora = TimeOfDay.now();
    final horario =
        '${agora.hour.toString().padLeft(2, '0')}:${agora.minute.toString().padLeft(2, '0')}';
    final chaveSelecionada = _normalizarData(_dataSelecionada);

    setState(() {
      final lista = List<_RegistroDiario>.from(
        _registrosPorData[chaveSelecionada] ?? [],
      );
      lista.insert(0, _RegistroDiario(horario: horario, texto: texto));
      _registrosPorData[chaveSelecionada] = lista;
      _notaController.clear();
    });
  }

  Future<void> _abrirCalendario() async {
    final dataEscolhida = await showDatePicker(
      context: context,
      locale: const Locale('pt', 'BR'),
      initialDate: _dataSelecionada,
      firstDate: DateTime(2023, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      helpText: 'Selecionar dia',
      cancelText: 'Cancelar',
      confirmText: 'Selecionar',
    );

    if (!mounted || dataEscolhida == null) {
      return;
    }

    setState(() {
      _dataSelecionada = dataEscolhida;
    });
  }

  void _voltarMes() {
    setState(() {
      final dataAnterior = DateTime(
        _dataSelecionada.year,
        _dataSelecionada.month - 1,
        1,
      );
      final ultimoDia = DateTime(
        dataAnterior.year,
        dataAnterior.month + 1,
        0,
      ).day;
      final diaAjustado = _dataSelecionada.day > ultimoDia
          ? ultimoDia
          : _dataSelecionada.day;

      _dataSelecionada = DateTime(
        dataAnterior.year,
        dataAnterior.month,
        diaAjustado,
      );
    });
  }

  void _avancarMes() {
    setState(() {
      final proximoMes = DateTime(
        _dataSelecionada.year,
        _dataSelecionada.month + 1,
        1,
      );
      final ultimoDia = DateTime(
        proximoMes.year,
        proximoMes.month + 1,
        0,
      ).day;
      final diaAjustado = _dataSelecionada.day > ultimoDia
          ? ultimoDia
          : _dataSelecionada.day;

      _dataSelecionada = DateTime(
        proximoMes.year,
        proximoMes.month,
        diaAjustado,
      );
    });
  }

  String _nomeMes(int mes) {
    const meses = [
      'Janeiro',
      'Fevereiro',
      'Marco',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro',
    ];

    return meses[mes - 1];
  }

  DateTime _normalizarData(DateTime data) {
    return DateTime(data.year, data.month, data.day);
  }

  bool _mesAnoIguais(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month;
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Row(
      children: [
        _IconSquareButton(icon: Icons.arrow_back_rounded, onTap: onBack),
        Expanded(
          child: Text(
            'Meu Diario',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        _IconSquareButton(
          icon: Icons.search_rounded,
          onTap: () {},
          color: palette.primaryText,
        ),
      ],
    );
  }
}

class _CalendarioCard extends StatelessWidget {
  const _CalendarioCard({
    required this.mesTitulo,
    required this.entradasMes,
    required this.diaSelecionado,
    required this.mesSelecionado,
    required this.diasComEntrada,
    required this.onSelectDia,
    required this.onMesAnterior,
    required this.onMesSeguinte,
    required this.onAbrirCalendario,
  });

  final String mesTitulo;
  final String entradasMes;
  final int diaSelecionado;
  final DateTime mesSelecionado;
  final Set<int> diasComEntrada;
  final ValueChanged<int> onSelectDia;
  final VoidCallback onMesAnterior;
  final VoidCallback onMesSeguinte;
  final VoidCallback onAbrirCalendario;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;
    const semanas = ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'];
    final primeiroDiaMes = DateTime(mesSelecionado.year, mesSelecionado.month, 1);
    final ultimoDiaMes = DateTime(
      mesSelecionado.year,
      mesSelecionado.month + 1,
      0,
    ).day;
    final deslocamento = primeiroDiaMes.weekday % 7;
    final totalCelulas = ((deslocamento + ultimoDiaMes + 6) ~/ 7) * 7;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFF121824),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: palette.divider),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mesTitulo,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: spacing.xs),
                    Text(
                      entradasMes,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF6BE0A3),
                      ),
                    ),
                  ],
                ),
              ),
              _IconSquareButton(icon: Icons.chevron_left_rounded, onTap: onMesAnterior),
              SizedBox(width: spacing.xs),
              _IconSquareButton(icon: Icons.chevron_right_rounded, onTap: onMesSeguinte),
              SizedBox(width: spacing.xs),
              _IconSquareButton(icon: Icons.calendar_month_rounded, onTap: onAbrirCalendario),
            ],
          ),
          SizedBox(height: spacing.md),
          Row(
            children: [
              for (final semana in semanas)
                Expanded(
                  child: Text(
                    semana,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: palette.secondaryText,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: spacing.sm),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalCelulas,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final dia = index - deslocamento + 1;
              final foraDoMes = dia < 1 || dia > ultimoDiaMes;

              if (foraDoMes) {
                return const SizedBox.shrink();
              }

              final selecionado = dia == diaSelecionado;
              final possuiEntrada = diasComEntrada.contains(dia);

              return GestureDetector(
                onTap: () => onSelectDia(dia),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selecionado
                            ? const Color(0xFF4A8EFF)
                            : Colors.transparent,
                        border: selecionado
                            ? null
                            : Border.all(color: palette.divider.withValues(alpha: 0.7)),
                      ),
                      child: Text(
                        '$dia',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: selecionado
                              ? const Color(0xFF071222)
                              : palette.primaryText,
                        ),
                      ),
                    ),
                    SizedBox(height: spacing.xs),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: possuiEntrada
                            ? const Color(0xFF58D98F)
                            : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DataSelecionadaHeader extends StatelessWidget {
  const _DataSelecionadaHeader({required this.dataSelecionada});

  final DateTime dataSelecionada;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Row(
      children: [
        Expanded(
          child: Text(
            '${dataSelecionada.day} de ${_nomeMes(dataSelecionada.month)}',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: spacing.sm + spacing.xs,
            vertical: spacing.xs,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF4A8EFF),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            'Hoje',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: const Color(0xFF071222),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  String _nomeMes(int mes) {
    const meses = [
      'Janeiro',
      'Fevereiro',
      'Marco',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro',
    ];

    return meses[mes - 1];
  }
}

class _AreaEscritaCard extends StatelessWidget {
  const _AreaEscritaCard({required this.controller, required this.onSalvar});

  final TextEditingController controller;
  final VoidCallback onSalvar;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFF121824),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: palette.divider),
      ),
      child: Column(
        children: [
          TextField(
            controller: controller,
            minLines: 6,
            maxLines: 8,
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: InputDecoration(
              hintText: 'Como foi seu dia?',
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: palette.secondaryText),
              border: InputBorder.none,
            ),
          ),
          SizedBox(height: spacing.sm),
          Row(
            children: [
              Icon(Icons.emoji_emotions_outlined, color: palette.secondaryText),
              SizedBox(width: spacing.sm),
              Icon(Icons.image_outlined, color: palette.secondaryText),
              SizedBox(width: spacing.sm),
              Icon(Icons.push_pin_outlined, color: palette.secondaryText),
              const Spacer(),
              FilledButton(
                onPressed: onSalvar,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFE8EDF7),
                  foregroundColor: const Color(0xFF1D2838),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: spacing.md,
                    vertical: spacing.sm,
                  ),
                ),
                child: const Text('Salvar Nota'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RegistroCard extends StatelessWidget {
  const _RegistroCard({required this.registro});

  final _RegistroDiario registro;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFF10141B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: palette.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                registro.horario,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Spacer(),
              Icon(Icons.edit_note_rounded, color: const Color(0xFF4A8EFF)),
            ],
          ),
          SizedBox(height: spacing.sm),
          Text(registro.texto, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

class _IconSquareButton extends StatelessWidget {
  const _IconSquareButton({required this.icon, this.onTap, this.color});

  final IconData icon;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return SizedBox(
      width: 40,
      height: 40,
      child: IconButton(
        onPressed: onTap,
        style: IconButton.styleFrom(
          backgroundColor: const Color(0xFF0F1520),
          foregroundColor: color ?? palette.primaryText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(color: palette.divider),
        ),
        icon: Icon(icon),
      ),
    );
  }
}

class _RegistroDiario {
  const _RegistroDiario({required this.horario, required this.texto});

  final String horario;
  final String texto;
}

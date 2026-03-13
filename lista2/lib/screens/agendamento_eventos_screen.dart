import 'package:flutter/material.dart';

import '../app_theme.dart';

class AgendamentoEventosScreen extends StatefulWidget {
  const AgendamentoEventosScreen({super.key});

  @override
  State<AgendamentoEventosScreen> createState() =>
      _AgendamentoEventosScreenState();
}

class _AgendamentoEventosScreenState extends State<AgendamentoEventosScreen> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _horarioController = TextEditingController();
  final TextEditingController _diaController = TextEditingController();

  final List<_Compromisso> _compromissos = [
    _Compromisso(
      id: 1,
      titulo: 'Aula de Flutter UI',
      horario: '09:00',
      data: '01 Nov 2023',
      dataHora: DateTime(2023, 11, 1, 9, 0),
    ),
    _Compromisso(
      id: 2,
      titulo: 'Mentoria de Projeto',
      horario: '11:30',
      data: '01 Nov 2023',
      dataHora: DateTime(2023, 11, 1, 11, 30),
    ),
    _Compromisso(
      id: 3,
      titulo: 'Review com Cliente',
      horario: '16:00',
      data: '02 Nov 2023',
      dataHora: DateTime(2023, 11, 2, 16, 0),
    ),
  ];

  int _proximoId = 4;
  String _categoriaSelecionada = 'Trabalho';
  DateTime _dataSelecionada = DateTime(2023, 11, 1);
  TimeOfDay _horarioSelecionado = const TimeOfDay(hour: 14, minute: 0);

  static const List<String> _categorias = [
    'Trabalho',
    'Estudos',
    'Pessoal',
    'Saude',
  ];

  @override
  void initState() {
    super.initState();
    _diaController.text = _dataSelecionada.day.toString().padLeft(2, '0');
    _horarioController.text = _formatarHorario(_horarioSelecionado);
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _horarioController.dispose();
    _diaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;
    final compromissosOrdenados = [..._compromissos]
      ..sort((a, b) => a.dataHora.compareTo(b.dataHora));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFF090909), palette.background],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              spacing.md,
              spacing.sm,
              spacing.md,
              spacing.xl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _BarraTopo(onVoltar: () => Navigator.of(context).pop()),
                SizedBox(height: spacing.md),
                _CardCalendario(
                  dataSelecionada: _dataSelecionada,
                  totalEventosMes: _compromissos.length,
                  onSelecionarDia: (data) {
                    setState(() {
                      _dataSelecionada = data;
                      _diaController.text = data.day.toString().padLeft(2, '0');
                    });
                  },
                ),
                SizedBox(height: spacing.md),
                _CardNovoEvento(
                  tituloController: _tituloController,
                  diaController: _diaController,
                  horarioController: _horarioController,
                  categoriaSelecionada: _categoriaSelecionada,
                  categorias: _categorias,
                  onSelecionarDia: _selecionarDiaDoMes,
                  onSelecionarHorario: _selecionarHorario,
                  onCategoriaChanged: (categoria) {
                    setState(() {
                      _categoriaSelecionada = categoria;
                    });
                  },
                  onConfirmar: _confirmarAgendamento,
                ),
                SizedBox(height: spacing.lg),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Meus Compromissos',
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: spacing.sm),
                for (final compromisso in compromissosOrdenados)
                  Padding(
                    padding: EdgeInsets.only(bottom: spacing.sm + spacing.xs),
                    child: _CardCompromisso(
                      compromisso: compromisso,
                      onExcluir: () => _removerCompromisso(compromisso.id),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _confirmarAgendamento() {
    final titulo = _tituloController.text.trim();
    final dia = _diaController.text.trim();
    final horario = _horarioController.text.trim();

    if (titulo.isEmpty || dia.isEmpty || horario.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha titulo, dia e horario para continuar.'),
        ),
      );
      return;
    }

    setState(() {
      _compromissos.add(
        _Compromisso(
          id: _proximoId++,
          titulo: titulo,
          horario: horario,
          data: _formatarData(_dataSelecionada),
          dataHora: _criarDataHora(_dataSelecionada, _horarioSelecionado),
        ),
      );
      _tituloController.clear();
    });

    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Agendamento confirmado em $_categoriaSelecionada.'),
      ),
    );
  }

  void _removerCompromisso(int id) {
    setState(() {
      _compromissos.removeWhere((item) => item.id == id);
    });
  }

  Future<void> _selecionarDiaDoMes() async {
    final data = await showDatePicker(
      context: context,
      initialDate: _dataSelecionada,
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime(2035, 12, 31),
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      helpText: 'Selecione o dia do evento',
      cancelText: 'Cancelar',
      confirmText: 'Selecionar',
    );

    if (data == null) {
      return;
    }

    setState(() {
      _dataSelecionada = data;
      _diaController.text = data.day.toString().padLeft(2, '0');
    });
  }

  Future<void> _selecionarHorario() async {
    final horario = await showTimePicker(
      context: context,
      initialTime: _horarioSelecionado,
      helpText: 'Selecione o horario do evento',
      cancelText: 'Cancelar',
      confirmText: 'Selecionar',
    );

    if (horario == null) {
      return;
    }

    setState(() {
      _horarioSelecionado = horario;
      _horarioController.text = _formatarHorario(horario);
    });
  }

  String _formatarHorario(TimeOfDay horario) {
    final hora = horario.hour.toString().padLeft(2, '0');
    final minuto = horario.minute.toString().padLeft(2, '0');
    return '$hora:$minuto';
  }

  String _formatarData(DateTime data) {
    const meses = [
      'Jan',
      'Fev',
      'Mar',
      'Abr',
      'Mai',
      'Jun',
      'Jul',
      'Ago',
      'Set',
      'Out',
      'Nov',
      'Dez',
    ];
    final dia = data.day.toString().padLeft(2, '0');
    final mes = meses[data.month - 1];
    return '$dia $mes ${data.year}';
  }

  DateTime _criarDataHora(DateTime data, TimeOfDay horario) {
    return DateTime(
      data.year,
      data.month,
      data.day,
      horario.hour,
      horario.minute,
    );
  }
}

class _BarraTopo extends StatelessWidget {
  const _BarraTopo({required this.onVoltar});

  final VoidCallback onVoltar;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Row(
      children: [
        IconButton(
          onPressed: onVoltar,
          icon: const Icon(Icons.arrow_back_rounded),
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xFF131313),
            foregroundColor: palette.primaryText,
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Agendamento',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_rounded),
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xFF131313),
            foregroundColor: palette.primaryText,
          ),
        ),
      ],
    );
  }
}

class _CardCalendario extends StatelessWidget {
  const _CardCalendario({
    required this.dataSelecionada,
    required this.totalEventosMes,
    required this.onSelecionarDia,
  });

  final DateTime dataSelecionada;
  final int totalEventosMes;
  final ValueChanged<DateTime> onSelecionarDia;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;
    final mesAno = _formatarMesAno(dataSelecionada);
    final dias = _construirGradeCalendario(dataSelecionada);
    final hoje = DateTime.now();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: palette.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mesAno,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: spacing.xs),
                    Text(
                      '$totalEventosMes eventos este mes',
                      style: textTheme.bodyMedium?.copyWith(
                        color: palette.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              _IconeQuadrado(icon: Icons.chevron_left_rounded),
              SizedBox(width: spacing.xs),
              _IconeQuadrado(icon: Icons.chevron_right_rounded),
            ],
          ),
          SizedBox(height: spacing.md),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _DiaSemanaLabel('DOM'),
              _DiaSemanaLabel('SEG'),
              _DiaSemanaLabel('TER'),
              _DiaSemanaLabel('QUA'),
              _DiaSemanaLabel('QUI'),
              _DiaSemanaLabel('SEX'),
              _DiaSemanaLabel('SAB'),
            ],
          ),
          SizedBox(height: spacing.sm),
          GridView.builder(
            itemCount: dias.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final data = dias[index];
              final ehMesAtual = data.month == dataSelecionada.month;
              final selecionado =
                  data.year == dataSelecionada.year &&
                  data.month == dataSelecionada.month &&
                  data.day == dataSelecionada.day;
              final destacado =
                  data.year == hoje.year &&
                  data.month == hoje.month &&
                  data.day == hoje.day;

              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => onSelecionarDia(data),
                child: Container(
                  decoration: BoxDecoration(
                    color: selecionado
                        ? const Color(0xFFF1F5F9)
                        : const Color(0xFF161616),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: destacado
                          ? const Color(0xFF94A3B8)
                          : const Color(0xFF1C1C1C),
                      width: destacado ? 1.3 : 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${data.day}',
                    style: TextStyle(
                      color: selecionado
                          ? const Color(0xFF090909)
                          : ehMesAtual
                          ? palette.primaryText
                          : palette.secondaryText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  List<DateTime> _construirGradeCalendario(DateTime referencia) {
    final inicioDoMes = DateTime(referencia.year, referencia.month, 1);
    final deslocamentoInicio = inicioDoMes.weekday % 7;
    final inicioGrade = inicioDoMes.subtract(
      Duration(days: deslocamentoInicio),
    );
    return List<DateTime>.generate(
      42,
      (index) => inicioGrade.add(Duration(days: index)),
    );
  }

  String _formatarMesAno(DateTime data) {
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
    return '${meses[data.month - 1]} ${data.year}';
  }
}

class _DiaSemanaLabel extends StatelessWidget {
  const _DiaSemanaLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Expanded(
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: palette.hint,
          fontWeight: FontWeight.w700,
          fontSize: 11,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

class _CardNovoEvento extends StatelessWidget {
  const _CardNovoEvento({
    required this.tituloController,
    required this.diaController,
    required this.horarioController,
    required this.categoriaSelecionada,
    required this.categorias,
    required this.onSelecionarDia,
    required this.onSelecionarHorario,
    required this.onCategoriaChanged,
    required this.onConfirmar,
  });

  final TextEditingController tituloController;
  final TextEditingController diaController;
  final TextEditingController horarioController;
  final String categoriaSelecionada;
  final List<String> categorias;
  final VoidCallback onSelecionarDia;
  final VoidCallback onSelecionarHorario;
  final ValueChanged<String> onCategoriaChanged;
  final VoidCallback onConfirmar;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: palette.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF1C1C1C),
                  border: Border.all(color: palette.divider),
                ),
                child: const Icon(Icons.add_rounded, size: 20),
              ),
              SizedBox(width: spacing.sm),
              Text(
                'Novo Evento',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: spacing.md),
          _LabelCampo(texto: 'Titulo do Evento'),
          SizedBox(height: spacing.sm),
          _CampoEscuro(
            controller: tituloController,
            hintText: 'Ex: Reuniao de Design',
            icon: Icons.edit_calendar_outlined,
          ),
          SizedBox(height: spacing.md),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _LabelCampo(texto: 'Dia do mes'),
                    SizedBox(height: spacing.sm),
                    _CampoEscuro(
                      controller: diaController,
                      icon: Icons.calendar_month_rounded,
                      readOnly: true,
                      onTap: onSelecionarDia,
                    ),
                  ],
                ),
              ),
              SizedBox(width: spacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _LabelCampo(texto: 'Horario'),
                    SizedBox(height: spacing.sm),
                    _CampoEscuro(
                      controller: horarioController,
                      icon: Icons.schedule_rounded,
                      readOnly: true,
                      onTap: onSelecionarHorario,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: spacing.md),
          _LabelCampo(texto: 'Categoria'),
          SizedBox(height: spacing.sm),
          _DropdownEscuro(
            value: categoriaSelecionada,
            options: categorias,
            onChanged: onCategoriaChanged,
          ),
          SizedBox(height: spacing.md),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onConfirmar,
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFF1F5F9),
                foregroundColor: const Color(0xFF0B0B0B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
                padding: EdgeInsets.symmetric(vertical: spacing.md),
              ),
              child: const Text('Confirmar Agendamento'),
            ),
          ),
        ],
      ),
    );
  }
}

class _LabelCampo extends StatelessWidget {
  const _LabelCampo({required this.texto});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: Theme.of(
        context,
      ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}

class _CampoEscuro extends StatelessWidget {
  const _CampoEscuro({
    required this.controller,
    this.hintText,
    required this.icon,
    this.readOnly = false,
    this.onTap,
  });

  final TextEditingController controller;
  final String? hintText;
  final IconData icon;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: palette.secondaryText),
        prefixIcon: Icon(icon, color: palette.secondaryText, size: 20),
        filled: true,
        fillColor: const Color(0xFF090909),
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacing.md,
          vertical: spacing.sm + spacing.xs,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: palette.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: palette.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.7)),
        ),
      ),
    );
  }
}

class _DropdownEscuro extends StatelessWidget {
  const _DropdownEscuro({
    required this.value,
    required this.options,
    required this.onChanged,
  });

  final String value;
  final List<String> options;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DropdownButtonFormField<String>(
      initialValue: value,
      isExpanded: true,
      dropdownColor: const Color(0xFF101010),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF090909),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: palette.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: palette.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.7)),
        ),
      ),
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: palette.secondaryText,
      ),
      items: options
          .map(
            (item) => DropdownMenuItem<String>(value: item, child: Text(item)),
          )
          .toList(),
      onChanged: (novoValor) {
        if (novoValor != null) {
          onChanged(novoValor);
        }
      },
    );
  }
}

class _CardCompromisso extends StatelessWidget {
  const _CardCompromisso({required this.compromisso, required this.onExcluir});

  final _Compromisso compromisso;
  final VoidCallback onExcluir;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: palette.divider),
      ),
      child: Row(
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              color: const Color(0xFF1B1B1B),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFF2A2A2A)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  compromisso.horario,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Icon(
                  Icons.schedule_rounded,
                  size: 14,
                  color: palette.secondaryText,
                ),
              ],
            ),
          ),
          SizedBox(width: spacing.sm + spacing.xs),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  compromisso.titulo,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: spacing.xs),
                Text(
                  compromisso.data,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: palette.secondaryText,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onExcluir,
            icon: const Icon(Icons.delete_outline_rounded),
            color: const Color(0xFFEF4444),
          ),
        ],
      ),
    );
  }
}

class _IconeQuadrado extends StatelessWidget {
  const _IconeQuadrado({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: const Color(0xFF181818),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: palette.divider),
      ),
      child: Icon(icon, size: 18, color: palette.primaryText),
    );
  }
}

class _Compromisso {
  const _Compromisso({
    required this.id,
    required this.titulo,
    required this.horario,
    required this.data,
    required this.dataHora,
  });

  final int id;
  final String titulo;
  final String horario;
  final String data;
  final DateTime dataHora;
}

import 'package:flutter/material.dart';

import '../app_theme.dart';

enum ModoAparencia { claro, escuro, sistema }

enum IdiomaApp { portuguesBrasil, englishUs, espanol }

class ConfiguracoesPreferenciasScreen extends StatefulWidget {
  const ConfiguracoesPreferenciasScreen({super.key});

  @override
  State<ConfiguracoesPreferenciasScreen> createState() =>
      _ConfiguracoesPreferenciasScreenState();
}

class _ConfiguracoesPreferenciasScreenState
    extends State<ConfiguracoesPreferenciasScreen> {
  final TextEditingController _usuarioController = TextEditingController(
    text: 'Dev_Flutter_BR',
  );

  ModoAparencia _modoSelecionado = ModoAparencia.escuro;
  IdiomaApp _idiomaSelecionado = IdiomaApp.portuguesBrasil;

  @override
  void dispose() {
    _usuarioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFF101010), palette.background],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              spacing.md,
              spacing.sm,
              spacing.md,
              spacing.lg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TopHeader(onBack: () => Navigator.of(context).pop()),
                SizedBox(height: spacing.lg),
                _SectionTitle(
                  icon: Icons.person_outline_rounded,
                  title: 'Perfil do Usuario',
                ),
                SizedBox(height: spacing.sm + spacing.xs),
                _ProfileCard(controller: _usuarioController),
                SizedBox(height: spacing.lg),
                _SectionTitle(
                  icon: Icons.palette_outlined,
                  title: 'Aparencia',
                ),
                SizedBox(height: spacing.sm + spacing.xs),
                _OpcaoRadioCard<ModoAparencia>(
                  value: _modoSelecionado,
                  onChanged: (modo) {
                    setState(() => _modoSelecionado = modo);
                  },
                  options: const [
                    _RadioOption(
                      value: ModoAparencia.claro,
                      titulo: 'Modo Claro',
                      subtitulo: 'Ideal para ambientes bem iluminados',
                    ),
                    _RadioOption(
                      value: ModoAparencia.escuro,
                      titulo: 'Modo Escuro',
                      subtitulo: 'Economiza bateria e reduz cansaco visual',
                    ),
                    _RadioOption(
                      value: ModoAparencia.sistema,
                      titulo: 'Sistema',
                      subtitulo: 'Segue as configuracoes do dispositivo',
                    ),
                  ],
                ),
                SizedBox(height: spacing.lg),
                _SectionTitle(
                  icon: Icons.language_rounded,
                  title: 'Idioma',
                ),
                SizedBox(height: spacing.sm + spacing.xs),
                _OpcaoRadioCard<IdiomaApp>(
                  value: _idiomaSelecionado,
                  onChanged: (idioma) {
                    setState(() => _idiomaSelecionado = idioma);
                  },
                  options: const [
                    _RadioOption(
                      value: IdiomaApp.portuguesBrasil,
                      titulo: 'Portugues (Brasil)',
                    ),
                    _RadioOption(
                      value: IdiomaApp.englishUs,
                      titulo: 'English (US)',
                    ),
                    _RadioOption(
                      value: IdiomaApp.espanol,
                      titulo: 'Espanol',
                    ),
                  ],
                ),
                SizedBox(height: spacing.lg),
                _ResumoAtualCard(
                  usuario: _usuarioAtual,
                  modoAparencia: _labelAparencia(_modoSelecionado),
                  idioma: _labelIdiomaResumo(_idiomaSelecionado),
                ),
                SizedBox(height: spacing.lg),
                _SalvarButton(onPressed: _salvarAlteracoes),
                SizedBox(height: spacing.md),
                Center(
                  child: Text(
                    'Versao do App 1.0.4',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: palette.hint),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String get _usuarioAtual {
    final texto = _usuarioController.text.trim();
    if (texto.isEmpty) {
      return 'Dev_Flutter_BR';
    }
    return texto;
  }

  void _salvarAlteracoes() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Preferencias salvas com sucesso!')),
    );
  }
}

class _TopHeader extends StatelessWidget {
  const _TopHeader({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: onBack,
          icon: const Icon(Icons.arrow_back_rounded),
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xFF181818),
            foregroundColor: palette.primaryText,
            minimumSize: const Size(42, 42),
          ),
        ),
        SizedBox(width: spacing.sm),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: spacing.xs),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Preferencias',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: spacing.xs),
                Text(
                  'Personalize sua experiencia',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Row(
      children: [
        Icon(icon, size: 20),
        SizedBox(width: spacing.sm),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.md),
      decoration: _cardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nome de Usuario',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(height: spacing.sm),
          TextField(
            controller: controller,
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: palette.secondaryText,
              ),
              filled: true,
              fillColor: const Color(0xFF0B0B0B),
              contentPadding: EdgeInsets.symmetric(
                horizontal: spacing.md,
                vertical: spacing.md,
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
                borderSide: BorderSide(color: palette.accent, width: 1.2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RadioOption<T> {
  const _RadioOption({required this.value, required this.titulo, this.subtitulo});

  final T value;
  final String titulo;
  final String? subtitulo;
}

class _OpcaoRadioCard<T> extends StatelessWidget {
  const _OpcaoRadioCard({
    required this.value,
    required this.onChanged,
    required this.options,
  });

  final T value;
  final ValueChanged<T> onChanged;
  final List<_RadioOption<T>> options;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Container(
      decoration: _cardDecoration(context),
      child: Column(
        children: [
          for (int i = 0; i < options.length; i++)
            InkWell(
              onTap: () => onChanged(options[i].value),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: spacing.md,
                  vertical: spacing.md,
                ),
                decoration: BoxDecoration(
                  border: i == options.length - 1
                      ? null
                      : Border(bottom: BorderSide(color: palette.divider)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            options[i].titulo,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          if (options[i].subtitulo != null) ...[
                            SizedBox(height: spacing.xs),
                            Text(
                              options[i].subtitulo!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ],
                      ),
                    ),
                    SizedBox(width: spacing.sm),
                    Icon(
                      options[i].value == value
                          ? Icons.radio_button_checked_rounded
                          : Icons.radio_button_off_rounded,
                      size: 22,
                      color: options[i].value == value
                          ? palette.accent
                          : palette.hint,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ResumoAtualCard extends StatelessWidget {
  const _ResumoAtualCard({
    required this.usuario,
    required this.modoAparencia,
    required this.idioma,
  });

  final String usuario;
  final String modoAparencia;
  final String idioma;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.md),
      decoration: _cardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resumo Atual',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: spacing.md),
          _ResumoLinha(
            icon: Icons.check_circle_outline_rounded,
            texto: 'Usuario: $usuario',
          ),
          SizedBox(height: spacing.sm),
          _ResumoLinha(
            icon: Icons.check_circle_outline_rounded,
            texto: 'Tema: $modoAparencia',
          ),
          SizedBox(height: spacing.sm),
          _ResumoLinha(
            icon: Icons.check_circle_outline_rounded,
            texto: 'Idioma: $idioma',
          ),
        ],
      ),
    );
  }
}

class _ResumoLinha extends StatelessWidget {
  const _ResumoLinha({required this.icon, required this.texto});

  final IconData icon;
  final String texto;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Row(
      children: [
        Icon(icon, size: 18, color: palette.secondaryText),
        SizedBox(width: spacing.sm),
        Expanded(
          child: Text(
            texto,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}

class _SalvarButton extends StatelessWidget {
  const _SalvarButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;
    final radii = context.radii;

    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.save_outlined),
        label: const Text('Salvar Alteracoes'),
        style: FilledButton.styleFrom(
          backgroundColor: palette.primary,
          foregroundColor: palette.onPrimary,
          padding: EdgeInsets.symmetric(vertical: spacing.md),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radii.full),
          ),
        ),
      ),
    );
  }
}

BoxDecoration _cardDecoration(BuildContext context) {
  final palette = context.palette;
  final shadows = context.shadows;

  return BoxDecoration(
    color: const Color(0xFF121212),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: palette.divider),
    boxShadow: [shadows.sm],
  );
}

String _labelAparencia(ModoAparencia modo) {
  switch (modo) {
    case ModoAparencia.claro:
      return 'Modo Claro';
    case ModoAparencia.escuro:
      return 'Modo Escuro';
    case ModoAparencia.sistema:
      return 'Sistema';
  }
}

String _labelIdiomaResumo(IdiomaApp idioma) {
  switch (idioma) {
    case IdiomaApp.portuguesBrasil:
      return 'Portugues';
    case IdiomaApp.englishUs:
      return 'English';
    case IdiomaApp.espanol:
      return 'Espanol';
  }
}

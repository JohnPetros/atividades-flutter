import 'package:flutter/material.dart';

import '../app_theme.dart';

enum TipoAvaliacao { excelente, bom, regular, ruim }

class FormularioFeedbackScreen extends StatefulWidget {
  const FormularioFeedbackScreen({super.key});

  @override
  State<FormularioFeedbackScreen> createState() =>
      _FormularioFeedbackScreenState();
}

class _FormularioFeedbackScreenState extends State<FormularioFeedbackScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mensagemController = TextEditingController();

  TipoAvaliacao _avaliacaoSelecionada = TipoAvaliacao.bom;

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _mensagemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;
    final radii = context.radii;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFF0C0C0C), palette.background],
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
                _FeedbackHeader(onVoltar: () => Navigator.of(context).pop()),
                SizedBox(height: spacing.lg),
                _FormSection(
                  icon: Icons.person_outline_rounded,
                  title: 'Suas Informacoes',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionLabel(texto: 'Nome Completo'),
                      SizedBox(height: spacing.sm),
                      _DarkTextField(
                        controller: _nomeController,
                        hintText: 'Ex: Joao Silva',
                        icon: Icons.person_outline_rounded,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(height: spacing.lg),
                      _SectionLabel(texto: 'E-mail'),
                      SizedBox(height: spacing.sm),
                      _DarkTextField(
                        controller: _emailController,
                        hintText: 'joao@exemplo.com.br',
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: spacing.md),
                Divider(color: palette.divider, height: spacing.lg),
                SizedBox(height: spacing.md),
                _FormSection(
                  icon: Icons.star_outline_rounded,
                  title: 'Como foi sua experiencia?',
                  child: Column(
                    children: TipoAvaliacao.values
                        .map(
                          (tipo) => Padding(
                            padding: EdgeInsets.only(bottom: spacing.sm + 2),
                            child: _AvaliacaoCard(
                              tipo: tipo,
                              selecionado: tipo == _avaliacaoSelecionada,
                              onTap: () {
                                setState(() {
                                  _avaliacaoSelecionada = tipo;
                                });
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(height: spacing.md),
                _FormSection(
                  icon: Icons.chat_bubble_outline_rounded,
                  title: 'Comentarios Adicionais',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionLabel(texto: 'Mensagem'),
                      SizedBox(height: spacing.sm),
                      _DarkTextField(
                        controller: _mensagemController,
                        hintText:
                            'Conte-nos mais detalhes sobre sua experiencia...',
                        maxLines: 6,
                        minLines: 6,
                        keyboardType: TextInputType.multiline,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: spacing.lg),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: _enviarFeedback,
                    icon: const Icon(Icons.send_rounded),
                    label: const Text('Enviar Feedback'),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFECEFF4),
                      foregroundColor: const Color(0xFF111111),
                      padding: EdgeInsets.symmetric(vertical: spacing.md),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radii.full),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: spacing.md),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(spacing.md),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F5F7),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFD5D8DE)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Icon(
                          Icons.info_outline_rounded,
                          color: Color(0xFF20242E),
                          size: 20,
                        ),
                      ),
                      SizedBox(width: spacing.sm),
                      Expanded(
                        child: Text(
                          'Seus dados estao protegidos e serao usados apenas para fins educacionais.',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: const Color(0xFF20242E)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _enviarFeedback() {
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Feedback enviado com sucesso!')),
    );
  }
}

class _FeedbackHeader extends StatelessWidget {
  const _FeedbackHeader({required this.onVoltar});

  final VoidCallback onVoltar;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: onVoltar,
          icon: const Icon(Icons.arrow_back_rounded),
          color: palette.primaryText,
          visualDensity: VisualDensity.compact,
          splashRadius: 20,
        ),
        SizedBox(width: spacing.xs),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Feedback do Usuario',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: spacing.xs),
              Text(
                'Exercicio 05 • Formulario',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: palette.secondaryText),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FormSection extends StatelessWidget {
  const _FormSection({
    required this.icon,
    required this.title,
    required this.child,
  });

  final IconData icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: palette.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: palette.primaryText),
              SizedBox(width: spacing.sm),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: palette.primaryText,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: spacing.md),
          child,
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.texto});

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

class _DarkTextField extends StatelessWidget {
  const _DarkTextField({
    required this.controller,
    required this.hintText,
    this.icon,
    this.maxLines = 1,
    this.minLines,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final int maxLines;
  final int? minLines;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return TextField(
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: palette.secondaryText),
        prefixIcon: icon == null
            ? null
            : Icon(icon, color: palette.secondaryText),
        filled: true,
        fillColor: const Color(0xFF0A0A0A),
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

class _AvaliacaoCard extends StatelessWidget {
  const _AvaliacaoCard({
    required this.tipo,
    required this.selecionado,
    required this.onTap,
  });

  final TipoAvaliacao tipo;
  final bool selecionado;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.all(spacing.md),
        decoration: BoxDecoration(
          color: const Color(0xFF0A0A0A),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selecionado
                ? Colors.white.withValues(alpha: 0.65)
                : palette.divider,
            width: selecionado ? 1.3 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(
                selecionado
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_unchecked_rounded,
                color: selecionado ? const Color(0xFFF2F4F7) : palette.hint,
                size: 21,
              ),
            ),
            SizedBox(width: spacing.sm + 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _tituloAvaliacao(tipo),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: palette.primaryText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: spacing.xs),
                  Text(
                    _descricaoAvaliacao(tipo),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: palette.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _tituloAvaliacao(TipoAvaliacao tipo) {
  switch (tipo) {
    case TipoAvaliacao.excelente:
      return 'Excelente';
    case TipoAvaliacao.bom:
      return 'Bom';
    case TipoAvaliacao.regular:
      return 'Regular';
    case TipoAvaliacao.ruim:
      return 'Ruim';
  }
}

String _descricaoAvaliacao(TipoAvaliacao tipo) {
  switch (tipo) {
    case TipoAvaliacao.excelente:
      return 'Superou todas as expectativas';
    case TipoAvaliacao.bom:
      return 'Atendeu bem as necessidades';
    case TipoAvaliacao.regular:
      return 'Poderia ser melhor em alguns pontos';
    case TipoAvaliacao.ruim:
      return 'Nao tive uma boa experiencia';
  }
}

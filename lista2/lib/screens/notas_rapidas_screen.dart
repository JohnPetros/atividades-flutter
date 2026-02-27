import 'package:flutter/material.dart';

import '../app_theme.dart';

class NotaRapida {
  const NotaRapida({
    required this.titulo,
    required this.previa,
    required this.metadado,
  });

  final String titulo;
  final String previa;
  final String metadado;
}

class NotasRapidasScreen extends StatefulWidget {
  const NotasRapidasScreen({super.key});

  @override
  State<NotasRapidasScreen> createState() => _NotasRapidasScreenState();
}

class _NotasRapidasScreenState extends State<NotasRapidasScreen> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _conteudoController = TextEditingController();

  final List<NotaRapida> _notas = [
    const NotaRapida(
      titulo: 'Lista de Compras',
      previa: 'Comprar leite, pao integral, ovos e frutas para a semana.',
      metadado: 'Hoje',
    ),
    const NotaRapida(
      titulo: 'Ideias para o App Flutter',
      previa:
          'Implementar um sistema de gerenciamento de estado robusto e animacoes suaves.',
      metadado: 'Ontem',
    ),
    const NotaRapida(
      titulo: 'Reuniao de Projeto',
      previa:
          'Discutir os prazos do cronograma e a alocacao de recursos da equipe.',
      metadado: '22 Out',
    ),
    const NotaRapida(
      titulo: 'Lembrete de Estudo',
      previa: 'Revisar os conceitos de LayoutBuilder e CustomPainter no Flutter.',
      metadado: '20 Out',
    ),
  ];

  @override
  void dispose() {
    _tituloController.dispose();
    _conteudoController.dispose();
    super.dispose();
  }

  void _salvarNota() {
    final titulo = _tituloController.text.trim();
    final conteudo = _conteudoController.text.trim();

    if (titulo.isEmpty && conteudo.isEmpty) {
      return;
    }

    setState(() {
      _notas.insert(
        0,
        NotaRapida(
          titulo: titulo.isEmpty ? 'Sem titulo' : titulo,
          previa: conteudo.isEmpty ? 'Sem conteudo informado.' : conteudo,
          metadado: 'Agora',
        ),
      );
      _tituloController.clear();
      _conteudoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Notas Rapidas'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.push_pin_outlined),
            tooltip: 'Organizar',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _salvarNota,
        backgroundColor: palette.primary,
        foregroundColor: palette.onPrimary,
        child: const Icon(Icons.edit_note_rounded),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              palette.surface.withValues(alpha: 0.9),
              palette.background,
            ],
          ),
        ),
        child: SafeArea(
          top: false,
          child: ListView(
            padding: EdgeInsets.fromLTRB(
              spacing.md,
              spacing.md,
              spacing.md,
              spacing.xl + 64,
            ),
            children: [
              _NewNoteCard(
                tituloController: _tituloController,
                conteudoController: _conteudoController,
                onSalvar: _salvarNota,
              ),
              SizedBox(height: spacing.lg),
              _NotasSectionHeader(),
              SizedBox(height: spacing.md),
              ..._notas.map(
                (nota) => Padding(
                  padding: EdgeInsets.only(bottom: spacing.sm + spacing.xs),
                  child: _NotaRapidaCard(nota: nota),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewNoteCard extends StatelessWidget {
  const _NewNoteCard({
    required this.tituloController,
    required this.conteudoController,
    required this.onSalvar,
  });

  final TextEditingController tituloController;
  final TextEditingController conteudoController;
  final VoidCallback onSalvar;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;
    final radii = context.radii;
    final shadows = context.shadows;

    return Container(
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: palette.divider),
        boxShadow: [shadows.md],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Titulo da Nota',
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: spacing.sm),
          _DarkInputField(
            controller: tituloController,
            hintText: 'Digite o titulo...',
            maxLines: 1,
          ),
          SizedBox(height: spacing.md),
          Text(
            'Conteudo',
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: spacing.sm),
          _DarkInputField(
            controller: conteudoController,
            hintText: 'Escreva suas ideias aqui...',
            maxLines: 6,
            minLines: 6,
          ),
          SizedBox(height: spacing.md),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: onSalvar,
              icon: const Icon(Icons.add_rounded),
              label: const Text('Salvar Nota'),
              style: FilledButton.styleFrom(
                backgroundColor: palette.primary,
                foregroundColor: palette.onPrimary,
                padding: EdgeInsets.symmetric(vertical: spacing.md),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radii.full),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DarkInputField extends StatelessWidget {
  const _DarkInputField({
    required this.controller,
    required this.hintText,
    required this.maxLines,
    this.minLines,
  });

  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return TextField(
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: palette.secondaryText),
        filled: true,
        fillColor: const Color(0xFF0B0B0B),
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
          borderSide: BorderSide(color: palette.accent, width: 1.2),
        ),
      ),
    );
  }
}

class _NotasSectionHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Row(
      children: [
        Expanded(
          child: Text(
            'Suas Notas',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: spacing.sm + 2,
            vertical: spacing.xs + 2,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF0B0B0B),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: palette.divider),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.tune_rounded, size: 14, color: palette.hint),
              SizedBox(width: spacing.xs + 2),
              Text('Recentes', style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
        ),
      ],
    );
  }
}

class _NotaRapidaCard extends StatelessWidget {
  const _NotaRapidaCard({required this.nota});

  final NotaRapida nota;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;
    final shadows = context.shadows;

    return Container(
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: palette.divider),
        boxShadow: [shadows.sm],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  nota.titulo,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(width: spacing.sm),
              Text(
                nota.metadado,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(color: palette.hint),
              ),
            ],
          ),
          SizedBox(height: spacing.sm - 2),
          Text(
            nota.previa,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: palette.secondaryText),
          ),
        ],
      ),
    );
  }
}

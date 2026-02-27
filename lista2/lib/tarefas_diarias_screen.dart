import 'package:flutter/material.dart';

import 'app_theme.dart';

enum Prioridade { baixa, media, alta }

class Tarefa {
  const Tarefa({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.prioridade,
    required this.concluida,
  });

  final String id;
  final String titulo;
  final String descricao;
  final Prioridade prioridade;
  final bool concluida;

  Tarefa copyWith({
    String? id,
    String? titulo,
    String? descricao,
    Prioridade? prioridade,
    bool? concluida,
  }) {
    return Tarefa(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
      prioridade: prioridade ?? this.prioridade,
      concluida: concluida ?? this.concluida,
    );
  }
}

class TarefasDiariasScreen extends StatefulWidget {
  const TarefasDiariasScreen({super.key});

  @override
  State<TarefasDiariasScreen> createState() => _TarefasDiariasScreenState();
}

class _TarefasDiariasScreenState extends State<TarefasDiariasScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  Prioridade _prioridadeSelecionada = Prioridade.media;

  List<Tarefa> _tarefas = const [
    Tarefa(
      id: 't1',
      titulo: 'Finalizar Protótipo',
      descricao: 'Concluir as telas de navegação do app acadêmico',
      prioridade: Prioridade.alta,
      concluida: false,
    ),
    Tarefa(
      id: 't2',
      titulo: 'Leitura Técnica',
      descricao: 'Ler documentação sobre Widgets de Estado',
      prioridade: Prioridade.media,
      concluida: true,
    ),
    Tarefa(
      id: 't3',
      titulo: 'Organizar Workspace',
      descricao: 'Limpar a mesa e organizar os cabos',
      prioridade: Prioridade.baixa,
      concluida: false,
    ),
    Tarefa(
      id: 't4',
      titulo: 'Revisão de Código',
      descricao: 'Verificar Pull Requests pendentes no GitHub',
      prioridade: Prioridade.alta,
      concluida: false,
    ),
  ];

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;
    final radii = context.radii;

    final tarefasAtivas = _tarefas.where((tarefa) => !tarefa.concluida).length;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tarefas Diárias'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: palette.accent,
        foregroundColor: Colors.white,
        onPressed: () {},
        icon: const Icon(Icons.bolt_rounded),
        label: const Text('Sugestão IA'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          spacing.md,
          spacing.md,
          spacing.md,
          spacing.xl + 78,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFormulario(context),
            SizedBox(height: spacing.lg),
            Row(
              children: [
                Text(
                  'Minhas Tarefas',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: spacing.sm + spacing.xs,
                    vertical: spacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: palette.surface,
                    borderRadius: BorderRadius.circular(radii.full),
                    border: Border.all(color: palette.divider),
                  ),
                  child: Text(
                    '$tarefasAtivas Ativas',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),
            SizedBox(height: spacing.sm + spacing.xs),
            ..._tarefas.map((tarefa) {
              return Padding(
                key: ValueKey(tarefa.id),
                padding: EdgeInsets.only(bottom: spacing.sm + spacing.xs),
                child: _TaskCard(
                  tarefa: tarefa,
                  onToggle: () => _alternarStatus(tarefa.id),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildFormulario(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;
    final radii = context.radii;

    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: palette.surface,
      hintStyle: Theme.of(
        context,
      ).textTheme.bodyMedium?.copyWith(color: palette.hint),
      contentPadding: EdgeInsets.symmetric(
        horizontal: spacing.md,
        vertical: spacing.sm + spacing.xs,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: palette.divider),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: palette.divider),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: palette.accent, width: 1.2),
      ),
    );

    return Container(
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: palette.background.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(radii.lg + 8),
        border: Border.all(color: palette.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nova Tarefa',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: spacing.md),
          _FieldLabel(texto: 'Nome da Tarefa'),
          SizedBox(height: spacing.sm),
          TextField(
            controller: _nomeController,
            decoration: inputDecoration.copyWith(
              hintText: 'Ex: Estudar Flutter',
            ),
          ),
          SizedBox(height: spacing.md),
          _FieldLabel(texto: 'Descrição'),
          SizedBox(height: spacing.sm),
          TextField(
            controller: _descricaoController,
            maxLines: 3,
            decoration: inputDecoration.copyWith(
              hintText: 'Detalhes sobre o que fazer...',
            ),
          ),
          SizedBox(height: spacing.md),
          _FieldLabel(texto: 'Nível de Prioridade'),
          SizedBox(height: spacing.sm),
          Row(
            children: Prioridade.values
                .map(
                  (prioridade) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: prioridade == Prioridade.alta ? 0 : spacing.sm,
                      ),
                      child: _PrioridadeChip(
                        prioridade: prioridade,
                        selecionada: _prioridadeSelecionada == prioridade,
                        onTap: () {
                          setState(() {
                            _prioridadeSelecionada = prioridade;
                          });
                        },
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: spacing.md),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _registrarTarefa,
              icon: const Icon(Icons.add_rounded),
              label: const Text('Registrar Tarefa'),
              style: FilledButton.styleFrom(
                foregroundColor: palette.onPrimary,
                backgroundColor: palette.primary,
                padding: EdgeInsets.symmetric(vertical: spacing.md - 2),
                textStyle: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(fontSize: 16),
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

  void _registrarTarefa() {
    final nome = _nomeController.text.trim();
    final descricao = _descricaoController.text.trim();

    if (nome.isEmpty || descricao.isEmpty) {
      return;
    }

    setState(() {
      _tarefas = [
        Tarefa(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          titulo: nome,
          descricao: descricao,
          prioridade: _prioridadeSelecionada,
          concluida: false,
        ),
        ..._tarefas,
      ];
      _nomeController.clear();
      _descricaoController.clear();
      _prioridadeSelecionada = Prioridade.media;
    });
  }

  void _alternarStatus(String id) {
    setState(() {
      _tarefas = _tarefas
          .map((tarefa) {
            if (tarefa.id != id) {
              return tarefa;
            }
            return tarefa.copyWith(concluida: !tarefa.concluida);
          })
          .toList(growable: false);
    });
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.texto});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}

class _PrioridadeChip extends StatelessWidget {
  const _PrioridadeChip({
    required this.prioridade,
    required this.selecionada,
    required this.onTap,
  });

  final Prioridade prioridade;
  final bool selecionada;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final radii = context.radii;

    return InkWell(
      borderRadius: BorderRadius.circular(radii.full),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radii.full),
          color: selecionada
              ? _corPrioridade(prioridade, palette).withValues(alpha: 0.22)
              : palette.surface,
          border: Border.all(
            color: selecionada
                ? _corPrioridade(prioridade, palette)
                : palette.divider,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              selecionada ? Icons.radio_button_checked : Icons.radio_button_off,
              size: 16,
              color: selecionada
                  ? _corPrioridade(prioridade, palette)
                  : palette.hint,
            ),
            const SizedBox(width: 8),
            Text(
              _labelPrioridade(prioridade),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: selecionada
                    ? palette.primaryText
                    : palette.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  const _TaskCard({required this.tarefa, required this.onToggle});

  final Tarefa tarefa;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;
    final radii = context.radii;

    final corPrioridade = _corPrioridade(tarefa.prioridade, palette);

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 220),
      opacity: tarefa.concluida ? 0.62 : 1,
      child: Container(
        padding: EdgeInsets.all(spacing.md),
        decoration: BoxDecoration(
          color: palette.surface,
          borderRadius: BorderRadius.circular(radii.lg + 8),
          border: Border.all(color: palette.divider),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              offset: const Offset(0, 8),
              blurRadius: 16,
              spreadRadius: -8,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: tarefa.concluida,
              onChanged: (_) => onToggle(),
              activeColor: palette.accent,
              side: BorderSide(color: palette.hint),
            ),
            SizedBox(width: spacing.xs),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          tarefa.titulo,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                decoration: tarefa.concluida
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                        ),
                      ),
                      SizedBox(width: spacing.sm),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: corPrioridade.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(radii.full),
                          border: Border.all(
                            color: corPrioridade.withValues(alpha: 0.45),
                          ),
                        ),
                        child: Text(
                          _labelPrioridade(tarefa.prioridade),
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(color: corPrioridade),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: spacing.xs),
                  Text(
                    tarefa.descricao,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: palette.secondaryText,
                      height: 1.35,
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

String _labelPrioridade(Prioridade prioridade) {
  switch (prioridade) {
    case Prioridade.baixa:
      return 'Baixa';
    case Prioridade.media:
      return 'Média';
    case Prioridade.alta:
      return 'Alta';
  }
}

Color _corPrioridade(Prioridade prioridade, AppPalette palette) {
  switch (prioridade) {
    case Prioridade.baixa:
      return palette.secondaryText;
    case Prioridade.media:
      return const Color(0xFFEAB308);
    case Prioridade.alta:
      return const Color(0xFFFB7185);
  }
}

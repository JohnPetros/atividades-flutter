import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../tarefas_diarias_screen.dart';
import 'agendamento_eventos_screen.dart';
import 'busca_cidades_screen.dart';
import 'catalogo_produtos_screen.dart';
import 'configuracoes_preferencias_screen.dart';
import 'diario_pessoal_screen.dart';
import 'exercise_placeholder_screen.dart';
import 'formulario_feedback_screen.dart';
import 'lista_compras_screen.dart';
import 'notas_rapidas_screen.dart';
import 'paises_capitais_screen.dart';

class MenuExerciciosScreen extends StatelessWidget {
  const MenuExerciciosScreen({super.key});

  static const _items = <ExerciseItem>[
    ExerciseItem(
      titulo: 'Lista de Compras',
      subtitulo: 'Gerencie itens com Checkbox e remocao dinamica.',
      icone: Icons.shopping_cart_outlined,
      corDestaque: Color(0xFF06B6D4),
    ),
    ExerciseItem(
      titulo: 'Tarefas Diarias',
      subtitulo: 'Cadastro com prioridades (Radio) e status de conclusao.',
      icone: Icons.check_circle_outline,
      corDestaque: Color(0xFF22C55E),
    ),
    ExerciseItem(
      titulo: 'Notas Rapidas',
      subtitulo: 'Editor de texto multilinhas com visualizacao de lista.',
      icone: Icons.edit_note_outlined,
      corDestaque: Color(0xFFF59E0B),
    ),
    ExerciseItem(
      titulo: 'Formulario de Feedback',
      subtitulo: 'Sistema de avaliacao com radio e campos de contato.',
      icone: Icons.forum_outlined,
      corDestaque: Color(0xFFEC4899),
    ),
    ExerciseItem(
      titulo: 'Configuracoes',
      subtitulo: 'Preferencias de tema, idioma e perfil do usuario.',
      icone: Icons.settings_outlined,
      corDestaque: Color(0xFF6366F1),
    ),
    ExerciseItem(
      titulo: 'Busca de Cidades',
      subtitulo: 'Input com Autocomplete e busca de cidades brasileiras.',
      icone: Icons.location_city_outlined,
      corDestaque: Color(0xFFFACC15),
    ),
    ExerciseItem(
      titulo: 'Paises e Capitais',
      subtitulo: 'Relacionamento de dados usando campos de busca inteligente.',
      icone: Icons.public_outlined,
      corDestaque: Color(0xFF14B8A6),
    ),
    ExerciseItem(
      titulo: 'Agendamento',
      subtitulo: 'Uso de Calendario e Selecao de Horario para eventos.',
      icone: Icons.calendar_month_outlined,
      corDestaque: Color(0xFFEF4444),
    ),
    ExerciseItem(
      titulo: 'Diario Pessoal',
      subtitulo: 'Registro de memorias vinculadas a datas especificas.',
      icone: Icons.auto_stories_outlined,
      corDestaque: Color(0xFFA855F7),
    ),
    ExerciseItem(
      titulo: 'Catalogo de Produtos',
      subtitulo: 'Navegacao por categorias usando TabBarView e Listas.',
      icone: Icons.inventory_2_outlined,
      corDestaque: Color(0xFF3B82F6),
    ),
  ];

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
            colors: [palette.surface, palette.background],
          ),
        ),
        child: SafeArea(
          child: ListView.builder(
            padding: EdgeInsets.fromLTRB(
              spacing.md,
              spacing.md,
              spacing.md,
              spacing.lg,
            ),
            itemCount: _items.length + 3,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const _Header();
              }

              if (index == 1) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    spacing.xs,
                    spacing.lg,
                    spacing.xs,
                    spacing.sm + spacing.xs,
                  ),
                  child: Text(
                    'Exercicios Praticos',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );
              }

              if (index == _items.length + 2) {
                return const _Footer();
              }

              final item = _items[index - 2];
              return Padding(
                padding: EdgeInsets.only(bottom: spacing.sm + spacing.xs),
                child: _ExerciseCard(
                  item: item,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => _buildScreen(item),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildScreen(ExerciseItem item) {
    switch (item.titulo) {
      case 'Lista de Compras':
        return const ListaComprasScreen();
      case 'Tarefas Diarias':
        return const TarefasDiariasScreen();
      case 'Notas Rapidas':
        return const NotasRapidasScreen();
      case 'Formulario de Feedback':
        return const FormularioFeedbackScreen();
      case 'Configuracoes':
        return const ConfiguracoesPreferenciasScreen();
      case 'Busca de Cidades':
        return const BuscaCidadesScreen();
      case 'Paises e Capitais':
        return const PaisesCapitaisScreen();
      case 'Catalogo de Produtos':
        return const CatalogoProdutosScreen();
      case 'Agendamento':
        return const AgendamentoEventosScreen();
      case 'Diario Pessoal':
        return const DiarioPessoalScreen();
      default:
        return ExercisePlaceholderScreen(titulo: item.titulo);
    }
  }
}

class _Header extends StatelessWidget {
  const _Header();

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
        borderRadius: BorderRadius.circular(radii.lg),
        border: Border.all(color: palette.divider),
        boxShadow: [shadows.lg],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flutter Lab',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  'Laboratorio de Componentes',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: palette.background,
              border: Border.all(color: palette.divider, width: 1.2),
            ),
            alignment: Alignment.center,
            child: Text(
              'JS',
              style: TextStyle(
                color: palette.primaryText,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExerciseCard extends StatelessWidget {
  const _ExerciseCard({required this.item, required this.onTap});

  final ExerciseItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;
    final radii = context.radii;
    final shadows = context.shadows;

    return Material(
      color: palette.surface,
      borderRadius: BorderRadius.circular(radii.lg),
      child: InkWell(
        borderRadius: BorderRadius.circular(radii.lg),
        onTap: onTap,
        child: Ink(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radii.lg),
            border: Border.all(color: palette.divider),
            boxShadow: [shadows.md],
          ),
          child: Row(
            children: [
              Container(
                width: 7,
                decoration: BoxDecoration(
                  color: item.corDestaque,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(radii.lg),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: spacing.md - 2),
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: palette.background,
                          borderRadius: BorderRadius.circular(radii.md),
                          border: Border.all(color: palette.divider),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          item.icone,
                          size: 22,
                          color: item.corDestaque,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.titulo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.subtitulo,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(height: 1.35),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: palette.hint,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Padding(
      padding: EdgeInsets.only(top: spacing.sm + spacing.xs + 2),
      child: Column(
        children: [
          Icon(
            Icons.flutter_dash_rounded,
            size: 22,
            color: palette.secondaryText,
          ),
          SizedBox(height: spacing.sm),
          Text(
            'Desenvolvido para fins didaticos',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class ExerciseItem {
  const ExerciseItem({
    required this.titulo,
    required this.subtitulo,
    required this.icone,
    required this.corDestaque,
  });

  final String titulo;
  final String subtitulo;
  final IconData icone;
  final Color corDestaque;
}

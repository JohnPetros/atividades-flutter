import 'package:flutter/material.dart';

import '../app_theme.dart';

class ListaComprasScreen extends StatefulWidget {
  const ListaComprasScreen({super.key});

  @override
  State<ListaComprasScreen> createState() => _ListaComprasScreenState();
}

class _ListaComprasScreenState extends State<ListaComprasScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final List<_ShoppingItem> _itens = [
    _ShoppingItem(nome: 'Leite Integral'),
    _ShoppingItem(nome: 'Pao de Forma'),
    _ShoppingItem(nome: 'Cafe Torrado', comprado: true),
    _ShoppingItem(nome: 'Acucar Refinado', comprado: true),
    _ShoppingItem(nome: 'Manteiga 200g', comprado: true),
  ];

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _adicionarItem() {
    final nome = _controller.text.trim();
    if (nome.isEmpty) {
      return;
    }

    setState(() {
      _itens.insert(0, _ShoppingItem(nome: nome));
      _controller.clear();
    });
    _focusNode.requestFocus();
  }

  void _alternarStatus(_ShoppingItem item, bool? marcado) {
    setState(() {
      item.comprado = marcado ?? false;
    });
  }

  void _removerItem(_ShoppingItem item) {
    setState(() {
      _itens.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;
    final radii = context.radii;
    final shadows = context.shadows;
    final pendentes = _itens.where((item) => !item.comprado).toList();
    final concluidos = _itens.where((item) => item.comprado).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Lista de Compras'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFF0E0E0E), palette.background],
          ),
        ),
        child: SafeArea(
          top: false,
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  spacing.md,
                  spacing.lg,
                  spacing.md,
                  108,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ListaHeader(),
                    SizedBox(height: spacing.xl),
                    Center(
                      child: Text(
                        'Adicionar novo item',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: spacing.md),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            focusNode: _focusNode,
                            onSubmitted: (_) => _adicionarItem(),
                            style: Theme.of(context).textTheme.bodyLarge,
                            decoration: InputDecoration(
                              hintText: 'Ex: Arroz, Feijao...',
                              hintStyle: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: palette.hint),
                              prefixIcon: Icon(
                                Icons.shopping_cart_outlined,
                                color: palette.secondaryText,
                              ),
                              filled: true,
                              fillColor: palette.surface,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: spacing.md,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide(color: palette.divider),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide(color: palette.divider),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide(
                                  color: palette.accent,
                                  width: 1.2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: spacing.sm),
                        SizedBox(
                          width: 52,
                          height: 52,
                          child: FilledButton(
                            onPressed: _adicionarItem,
                            style: FilledButton.styleFrom(
                              backgroundColor: palette.primary,
                              foregroundColor: palette.onPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0,
                            ),
                            child: const Icon(Icons.arrow_forward_rounded),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: spacing.xl),
                    _SectionTitle(
                      icon: Icons.checklist_rounded,
                      title: 'Itens para Comprar',
                      color: palette.primaryText,
                    ),
                    SizedBox(height: spacing.sm + spacing.xs),
                    if (pendentes.isEmpty)
                      _EmptyStateCard(
                        text: 'Nenhum item pendente no momento.',
                        color: palette.secondaryText,
                      )
                    else
                      ...pendentes.map(
                        (item) => Padding(
                          padding: EdgeInsets.only(bottom: spacing.sm),
                          child: _ShoppingItemCard(
                            item: item,
                            cardColor: palette.surface,
                            textColor: palette.primaryText,
                            checkboxActiveColor: palette.accent,
                            iconColor: palette.error,
                            borderColor: palette.divider,
                            shadow: shadows.md,
                            onChanged: (value) => _alternarStatus(item, value),
                            onDelete: () => _removerItem(item),
                          ),
                        ),
                      ),
                    SizedBox(height: spacing.lg),
                    _SectionTitle(
                      icon: Icons.check_circle_rounded,
                      title: 'Ja no Carrinho',
                      color: palette.success,
                    ),
                    SizedBox(height: spacing.sm + spacing.xs),
                    if (concluidos.isEmpty)
                      _EmptyStateCard(
                        text: 'Marque itens para preencher esta secao.',
                        color: palette.secondaryText,
                      )
                    else
                      ...concluidos.map(
                        (item) => Padding(
                          padding: EdgeInsets.only(bottom: spacing.sm),
                          child: _ShoppingItemCard(
                            item: item,
                            cardColor: const Color(0xFF161616),
                            textColor: palette.secondaryText,
                            checkboxActiveColor: palette.success,
                            iconColor: palette.error,
                            borderColor: const Color(0xFF1F1F1F),
                            shadow: shadows.sm,
                            onChanged: (value) => _alternarStatus(item, value),
                            onDelete: () => _removerItem(item),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Positioned(
                right: spacing.md,
                bottom: spacing.lg,
                child: FloatingActionButton.extended(
                  onPressed: _adicionarItem,
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('Novo Item'),
                  backgroundColor: palette.primary,
                  foregroundColor: palette.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radii.full),
                  ),
                  elevation: shadows.lg.blurRadius / 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListaHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lista de Compras',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: spacing.xs),
              Text(
                'Organize seus mantimentos',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: palette.secondaryText),
              ),
            ],
          ),
        ),
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF151515),
            border: Border.all(color: palette.divider),
          ),
          child: Icon(
            Icons.shopping_cart_rounded,
            color: palette.primaryText,
            size: 22,
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.icon,
    required this.title,
    required this.color,
  });

  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Row(
      children: [
        Icon(icon, size: 20, color: color),
        SizedBox(width: spacing.sm),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _ShoppingItemCard extends StatelessWidget {
  const _ShoppingItemCard({
    required this.item,
    required this.cardColor,
    required this.textColor,
    required this.checkboxActiveColor,
    required this.iconColor,
    required this.borderColor,
    required this.shadow,
    required this.onChanged,
    required this.onDelete,
  });

  final _ShoppingItem item;
  final Color cardColor;
  final Color textColor;
  final Color checkboxActiveColor;
  final Color iconColor;
  final Color borderColor;
  final BoxShadow shadow;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: borderColor),
        boxShadow: [shadow],
      ),
      child: Row(
        children: [
          Checkbox(
            value: item.comprado,
            onChanged: onChanged,
            activeColor: checkboxActiveColor,
            checkColor: Colors.black,
            side: BorderSide(
              color: textColor.withValues(alpha: 0.5),
              width: 1.3,
            ),
          ),
          Expanded(
            child: Text(
              item.nome,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          IconButton(
            onPressed: onDelete,
            splashRadius: 20,
            icon: Icon(Icons.delete_outline_rounded, color: iconColor),
          ),
          SizedBox(width: spacing.xs),
        ],
      ),
    );
  }
}

class _EmptyStateCard extends StatelessWidget {
  const _EmptyStateCard({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xFF121212),
        border: Border.all(color: const Color(0xFF202020)),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: color),
      ),
    );
  }
}

class _ShoppingItem {
  _ShoppingItem({required this.nome, this.comprado = false});

  final String nome;
  bool comprado;
}

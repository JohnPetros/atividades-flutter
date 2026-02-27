import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final TextEditingController _itemController = TextEditingController();
  final FocusNode _itemFocusNode = FocusNode();

  final List<_ShoppingItem> _items = [
    _ShoppingItem(name: 'Leite Integral 1L', addedLabel: 'Adicionado hoje'),
    _ShoppingItem(name: 'Pao de Forma Artesanal', addedLabel: 'Adicionado hoje'),
    _ShoppingItem(name: 'Cafe Torrado e Moido 500g', addedLabel: 'Adicionado ontem'),
    _ShoppingItem(name: 'Arroz Agulhinha 5kg', isBought: true),
    _ShoppingItem(name: 'Detergente Neutro', isBought: true),
  ];

  List<_ShoppingItem> get _pendingItems =>
      _items.where((item) => !item.isBought).toList();

  List<_ShoppingItem> get _boughtItems =>
      _items.where((item) => item.isBought).toList();

  @override
  void dispose() {
    _itemController.dispose();
    _itemFocusNode.dispose();
    super.dispose();
  }

  void _addItem() {
    final value = _itemController.text.trim();
    if (value.isEmpty) {
      return;
    }

    setState(() {
      _items.insert(0, _ShoppingItem(name: value, addedLabel: 'Adicionado agora'));
      _itemController.clear();
    });
  }

  void _toggleBought(_ShoppingItem item) {
    setState(() {
      item.isBought = !item.isBought;
    });
  }

  void _removeItem(_ShoppingItem item) {
    setState(() {
      _items.remove(item);
    });
  }

  void _shareList() {
    final pending = _pendingItems.map((item) => '- ${item.name}').join('\n');
    final bought = _boughtItems.map((item) => '- ${item.name}').join('\n');
    final message =
        'Itens pendentes:\n${pending.isEmpty ? '- Nenhum item' : pending}\n\n'
        'Comprados:\n${bought.isEmpty ? '- Nenhum item' : bought}';

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message), duration: const Duration(seconds: 4)),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _shareList,
        icon: const Icon(Icons.share_rounded),
        label: const Text('Compartilhar'),
        backgroundColor: AppColors.primary,
        foregroundColor: const Color(0xFF0F3C7A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(44)),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 120),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Lista de Compras',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 36,
                      height: 1.1,
                      letterSpacing: -0.4,
                    ),
                  ),
                ),
                const Icon(
                  Icons.shopping_basket_rounded,
                  color: AppColors.primary,
                  size: 34,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Gerencie seus itens e organize suas idas ao mercado.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                color: AppColors.secondaryText,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: _itemController,
                    focusNode: _itemFocusNode,
                    onSubmitted: (_) => _addItem(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    decoration: InputDecoration(
                      hintText: 'O que voce precisa comprar?',
                      hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 22,
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: const Icon(
                        Icons.add_shopping_cart_rounded,
                        color: AppColors.secondaryText,
                        size: 30,
                      ),
                      filled: true,
                      fillColor: AppColors.surface,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFF171F33),
                          width: 1.3,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFF171F33),
                          width: 1.3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: AppColors.border,
                          width: 1.6,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                SizedBox(
                  width: 78,
                  height: 78,
                  child: Material(
                    color: AppColors.primary,
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: _addItem,
                      child: const Icon(
                        Icons.add_rounded,
                        color: Color(0xFF0F3C7A),
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Itens na lista',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    '${_pendingItems.length} itens',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            if (_pendingItems.isEmpty)
              _EmptySection(onAddPressed: () => _itemFocusNode.requestFocus()),
            for (final item in _pendingItems)
              _ShoppingCard(
                item: item,
                onToggle: () => _toggleBought(item),
                onRemove: () => _removeItem(item),
              ),
            if (_boughtItems.isNotEmpty) ...[
              const SizedBox(height: 14),
              Row(
                children: [
                  const Icon(
                    Icons.task_alt_rounded,
                    color: AppColors.primaryText,
                    size: 36,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Comprado',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              for (final item in _boughtItems)
                Opacity(
                  opacity: 0.82,
                  child: _ShoppingCard(
                    item: item,
                    onToggle: () => _toggleBought(item),
                    onRemove: () => _removeItem(item),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ShoppingCard extends StatelessWidget {
  const _ShoppingCard({
    required this.item,
    required this.onToggle,
    required this.onRemove,
  });

  final _ShoppingItem item;
  final VoidCallback onToggle;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final textColor = item.isBought ? AppColors.secondaryText : AppColors.primaryText;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.border, width: 1.6),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(999),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: item.isBought ? AppColors.secondaryText : AppColors.border,
                  width: 2,
                ),
              ),
              alignment: Alignment.center,
              child: item.isBought
                  ? const Icon(
                      Icons.check_rounded,
                      size: 26,
                      color: AppColors.secondaryText,
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                    decoration:
                        item.isBought ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
                if (!item.isBought) ...[
                  const SizedBox(height: 2),
                  Text(
                    item.addedLabel,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 13,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ],
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: Color(0xFFD99898),
              size: 34,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptySection extends StatelessWidget {
  const _EmptySection({required this.onAddPressed});

  final VoidCallback onAddPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.border, width: 1.5),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.inventory_2_outlined,
            color: AppColors.secondaryText,
            size: 40,
          ),
          const SizedBox(height: 8),
          Text(
            'Sua lista esta vazia',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.primaryText,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Adicione itens acima para comecar',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.secondaryText,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: onAddPressed,
            icon: const Icon(Icons.add_rounded),
            label: const Text('Adicionar item'),
          ),
        ],
      ),
    );
  }
}

class _ShoppingItem {
  _ShoppingItem({
    required this.name,
    this.addedLabel = 'Adicionado hoje',
    this.isBought = false,
  });

  final String name;
  final String addedLabel;
  bool isBought;
}

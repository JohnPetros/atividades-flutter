import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class DiscountCalculatorScreen extends StatefulWidget {
  const DiscountCalculatorScreen({super.key});

  @override
  State<DiscountCalculatorScreen> createState() =>
      _DiscountCalculatorScreenState();
}

class _DiscountCalculatorScreenState extends State<DiscountCalculatorScreen> {
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _priceController = TextEditingController(
    text: '120.00',
  );
  final TextEditingController _discountController = TextEditingController(
    text: '20',
  );

  final List<_ProductItem> _savedProducts = [
    const _ProductItem(name: 'Teclado Mecânico', price: 120, discount: 15),
    const _ProductItem(name: 'Mouse Gamer', price: 60, discount: 10),
    const _ProductItem(name: 'Suporte para Monitor', price: 45, discount: 50),
  ];

  double _youSave = 24;
  double _totalToPay = 96;

  @override
  void dispose() {
    _productController.dispose();
    _priceController.dispose();
    _discountController.dispose();
    super.dispose();
  }

  double? _parseNumber(String value) {
    return double.tryParse(value.trim().replaceAll(',', '.'));
  }

  String _money(double value) => 'R\$${value.toStringAsFixed(2)}';

  void _calculatePreview() {
    final price = _parseNumber(_priceController.text);
    final discount = _parseNumber(_discountController.text);

    if (price == null || discount == null) {
      setState(() {
        _youSave = 0;
        _totalToPay = 0;
      });
      return;
    }

    final safeDiscount = discount.clamp(0, 100);
    final youSave = price * safeDiscount / 100;

    setState(() {
      _youSave = youSave;
      _totalToPay = price - youSave;
    });
  }

  void _addProduct() {
    final productName = _productController.text.trim();
    final price = _parseNumber(_priceController.text);
    final discount = _parseNumber(_discountController.text);

    if (productName.isEmpty || price == null || discount == null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text('Informe nome, preço e desconto corretamente.'),
          ),
        );
      return;
    }

    if (discount < 0 || discount > 100) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('O desconto deve estar entre 0 e 100.')),
        );
      return;
    }

    final item = _ProductItem(name: productName, price: price, discount: discount);

    setState(() {
      _savedProducts.insert(0, item);
      _youSave = item.savedAmount;
      _totalToPay = item.finalPrice;
    });

    _productController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _DiscountHeader(onBack: () => Navigator.of(context).maybePop()),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(36),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _InputField(
                    label: 'Nome do Produto',
                    hint: 'ex.: Fone sem fio',
                    icon: Icons.inventory_2_rounded,
                    controller: _productController,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _InputField(
                          label: 'Preço (R\$)',
                          hint: '0.00',
                          icon: Icons.payments_rounded,
                          controller: _priceController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onChanged: (_) => _calculatePreview(),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _InputField(
                          label: 'Desconto (%)',
                          hint: '20',
                          icon: Icons.percent_rounded,
                          controller: _discountController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onChanged: (_) => _calculatePreview(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  _ResultCard(
                    youSaveText: _money(_youSave),
                    totalToPayText: _money(_totalToPay),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    height: 64,
                    child: FilledButton.icon(
                      onPressed: _addProduct,
                      icon: const Icon(Icons.add_shopping_cart_rounded, size: 26),
                      label: const Text('Adicionar à Lista'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: const Color(0xFF0D3F89),
                        textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Produtos Cadastrados',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 24,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Text(
                      '${_savedProducts.length} itens',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF5E0035),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                children: _savedProducts
                    .map(
                      (item) => _ProductCard(
                        name: item.name,
                        originalText: '${_money(item.price)} - ${item.discount.toStringAsFixed(0)}% OFF',
                        finalText: _money(item.finalPrice),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DiscountHeader extends StatelessWidget {
  const _DiscountHeader({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 34),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF9DBFFF), Color(0xFFFFB1D4)],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(64)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _HeaderCircleButton(icon: Icons.arrow_back_rounded, onPressed: onBack),
              const _HeaderCircleButton(icon: Icons.settings_rounded),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Calculadora de Desconto',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 25,
              color: const Color(0xFF0D3F89),
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Calcule economia e gerencie sua lista de produtos',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 17,
              color: const Color(0xFF0D3F89),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderCircleButton extends StatelessWidget {
  const _HeaderCircleButton({required this.icon, this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: const BoxDecoration(
        color: Color(0x33FFFFFF),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 34, color: const Color(0xFF0D3F89)),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.keyboardType,
    this.onChanged,
  });

  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 20,
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          onChanged: onChanged,
          keyboardType: keyboardType,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 19,
            color: AppColors.primaryText,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 19,
              color: AppColors.secondaryText,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: Icon(icon, size: 28, color: AppColors.secondaryText),
            filled: true,
            fillColor: const Color(0xFF050A17),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: AppColors.border, width: 1.4),
            ),
          ),
        ),
      ],
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.youSaveText, required this.totalToPayText});

  final String youSaveText;
  final String totalToPayText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border, width: 1.4),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ResultValue(label: 'Você Economiza', value: youSaveText, align: CrossAxisAlignment.start),
          _ResultValue(label: 'Total a Pagar', value: totalToPayText, align: CrossAxisAlignment.end),
        ],
      ),
    );
  }
}

class _ResultValue extends StatelessWidget {
  const _ResultValue({
    required this.label,
    required this.value,
    required this.align,
  });

  final String label;
  final String value;
  final CrossAxisAlignment align;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.secondaryText,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.primaryText,
            fontSize: 28,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.name,
    required this.originalText,
    required this.finalText,
  });

  final String name;
  final String originalText;
  final String finalText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border, width: 1.4),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF101A33),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.local_offer_rounded,
              color: AppColors.primary,
              size: 26,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primaryText,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Original: $originalText',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.secondaryText,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Preço Final',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.secondaryText,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                finalText,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.primaryText,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProductItem {
  const _ProductItem({
    required this.name,
    required this.price,
    required this.discount,
  });

  final String name;
  final double price;
  final double discount;

  double get savedAmount => price * discount / 100;

  double get finalPrice => price - savedAmount;
}

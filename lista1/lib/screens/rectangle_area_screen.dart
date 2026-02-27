import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class RectangleAreaScreen extends StatefulWidget {
  const RectangleAreaScreen({super.key});

  @override
  State<RectangleAreaScreen> createState() => _RectangleAreaScreenState();
}

class _RectangleAreaScreenState extends State<RectangleAreaScreen> {
  final TextEditingController _widthController = TextEditingController(
    text: '10',
  );
  final TextEditingController _heightController = TextEditingController(
    text: '5',
  );

  double _width = 10;
  double _height = 5;
  double _area = 50;

  @override
  void dispose() {
    _widthController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _showInfo() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text('Área do Retângulo'),
        content: const Text(
          'Informe os valores de largura e altura para calcular a área do retângulo.\n\n'
          'Fórmula: Área = Largura x Altura',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  void _calculateArea() {
    final width = _parseNumber(_widthController.text);
    final height = _parseNumber(_heightController.text);

    if (width == null || height == null || width <= 0 || height <= 0) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text(
              'Informe valores válidos maiores que zero para largura e altura.',
            ),
          ),
        );
      return;
    }

    setState(() {
      _width = width;
      _height = height;
      _area = width * height;
    });
  }

  double? _parseNumber(String value) {
    return double.tryParse(value.trim().replaceAll(',', '.'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.primaryText,
                      size: 34,
                    ),
                  ),
                  IconButton(
                    onPressed: _showInfo,
                    icon: const Icon(
                      Icons.info_outline_rounded,
                      color: AppColors.secondaryText,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                'Área do Retângulo',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 54,
                  height: 1,
                  letterSpacing: -1.1,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Calcule a área total informando as dimensões abaixo.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 19,
                  height: 1.32,
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 26),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  border: Border.all(color: AppColors.border, width: 1.7),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.functions_rounded,
                      color: AppColors.primary,
                      size: 28,
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fórmula',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: AppColors.secondaryText,
                                fontSize: 15,
                              ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Área = Largura x Altura',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryText,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              _DimensionInput(
                label: 'Largura',
                hint: 'Informe a largura (ex.: 10)',
                icon: Icons.straighten_rounded,
                controller: _widthController,
              ),
              const SizedBox(height: 18),
              _DimensionInput(
                label: 'Altura',
                hint: 'Informe a altura (ex.: 5)',
                icon: Icons.height_rounded,
                controller: _heightController,
              ),
              const SizedBox(height: 22),
              SizedBox(
                height: 70,
                child: FilledButton.icon(
                  onPressed: _calculateArea,
                  icon: const Icon(Icons.calculate_rounded, size: 24),
                  label: Text(
                    'Calcular Área',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF154384),
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),
              Text(
                'Resultado',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 44 / 2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              _ResultCard(area: _area),
              const SizedBox(height: 18),
              _VisualPreview(width: _width, height: _height),
            ],
          ),
        ),
      ),
    );
  }
}

class _DimensionInput extends StatelessWidget {
  const _DimensionInput({
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
  });

  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.primaryText,
            fontSize: 42 / 2,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.secondaryText,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: Icon(icon, color: AppColors.secondaryText, size: 28),
            filled: true,
            fillColor: const Color(0xFF030712),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(26),
              borderSide: const BorderSide(
                color: Color(0xFF101628),
                width: 1.2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(26),
              borderSide: const BorderSide(
                color: Color(0xFF101628),
                width: 1.2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(26),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.area});

  final double area;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(42),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -6,
            right: -14,
            child: Container(
              width: 188,
              height: 188,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.09),
              ),
            ),
          ),
          Positioned(
            left: -66,
            bottom: 36,
            child: Container(
              width: 124,
              height: 124,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.09),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                area.toStringAsFixed(2),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: const Color(0xFF093D88),
                  fontSize: 78,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1,
                ),
              ),
              Text(
                'Unidades Quadradas',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: const Color(0xFF24508F),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VisualPreview extends StatelessWidget {
  const _VisualPreview({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final ratio = width > 0 && height > 0 ? width / height : 1;
    final normalized = ratio.clamp(0.35, 2.4);
    final previewWidth = 90.0 * normalized;
    const previewHeight = 90.0;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        border: Border.all(color: AppColors.border, width: 1.7),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pré-visualização',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 38 / 2,
                  color: AppColors.secondaryText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(
                Icons.aspect_ratio_rounded,
                color: AppColors.primaryText,
                size: 24,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 124,
            alignment: Alignment.center,
            child: SizedBox(
              width: math.max(110, previewWidth + 52),
              child: Center(
                child: Container(
                  width: previewWidth,
                  height: previewHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.primary, width: 3),
                    color: AppColors.primary.withValues(alpha: 0.06),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Área',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 34 / 2,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Icon(
                        Icons.texture_rounded,
                        size: 26,
                        color: AppColors.primary.withValues(alpha: 0.4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               _PreviewMeasure(label: 'Largura', value: width),
               _PreviewMeasure(label: 'Altura', value: height),
            ],
          ),
        ],
      ),
    );
  }
}

class _PreviewMeasure extends StatelessWidget {
  const _PreviewMeasure({required this.label, required this.value});

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toStringAsFixed(value == value.roundToDouble() ? 0 : 1),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.primaryText,
            fontSize: 38 / 2,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.secondaryText,
            fontSize: 36 / 2,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

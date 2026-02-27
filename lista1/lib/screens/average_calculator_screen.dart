import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AverageCalculatorScreen extends StatefulWidget {
  const AverageCalculatorScreen({super.key});

  @override
  State<AverageCalculatorScreen> createState() =>
      _AverageCalculatorScreenState();
}

class _AverageCalculatorScreenState extends State<AverageCalculatorScreen> {
  final TextEditingController _grade1Controller = TextEditingController(
    text: '0.0',
  );
  final TextEditingController _grade2Controller = TextEditingController(
    text: '0.0',
  );
  final TextEditingController _grade3Controller = TextEditingController(
    text: '0.0',
  );

  double _average = 8.5;

  @override
  void dispose() {
    _grade1Controller.dispose();
    _grade2Controller.dispose();
    _grade3Controller.dispose();
    super.dispose();
  }

  void _showInfo() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text('Media Aritmetica'),
        content: const Text(
          'Digite tres notas e pressione "Calcular Media".\n\n'
          'Formula: (Nota 1 + Nota 2 + Nota 3) / 3',
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

  void _calculateAverage() {
    final grade1 = _parseGrade(_grade1Controller.text);
    final grade2 = _parseGrade(_grade2Controller.text);
    final grade3 = _parseGrade(_grade3Controller.text);

    if (grade1 == null || grade2 == null || grade3 == null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Digite valores numericos validos.')),
        );
      return;
    }

    setState(() {
      _average = (grade1 + grade2 + grade3) / 3;
    });
  }

  double? _parseGrade(String value) {
    return double.tryParse(value.trim().replaceAll(',', '.'));
  }

  bool get _isApproved => _average >= 7;

  String get _resultLabel => _isApproved ? 'APROVADO' : 'REPROVADO';

  String get _resultDescription =>
      _isApproved ? 'Acima da media (7.0)' : 'Abaixo da media (7.0)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
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
                      size: 30,
                    ),
                  ),
                  Text(
                    'EduCalc',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 42 / 2,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
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
              const SizedBox(height: 14),
              Text(
                'Media Aritmetica',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 58 / 2,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Insira as tres notas abaixo para calcular a media final do aluno.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  height: 1.35,
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: AppColors.border, width: 1.6),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.functions_rounded,
                      color: AppColors.secondaryText,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '(Nota 1 + Nota 2 + Nota 3) / 3',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.secondaryText,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: AppColors.border, width: 1.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _GradeInput(
                      label: 'Primeira Nota',
                      icon: Icons.looks_one_rounded,
                      controller: _grade1Controller,
                    ),
                    const SizedBox(height: 16),
                    _GradeInput(
                      label: 'Segunda Nota',
                      icon: Icons.looks_two_rounded,
                      controller: _grade2Controller,
                    ),
                    const SizedBox(height: 16),
                    _GradeInput(
                      label: 'Terceira Nota',
                      icon: Icons.looks_3_rounded,
                      controller: _grade3Controller,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 64,
                      child: FilledButton.icon(
                        onPressed: _calculateAverage,
                        icon: const Icon(Icons.calculate_rounded, size: 24),
                        label: Text(
                          'Calcular Media',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF143C7A),
                              ),
                        ),
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: Column(
                  children: [
                    Text(
                      'Media Final',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18,
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _average.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontSize: 70,
                                letterSpacing: -1,
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          _resultLabel,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: AppColors.primaryText,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: AppColors.border, height: 1),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Status',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    fontSize: 14,
                                    color: AppColors.secondaryText,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _resultDescription,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontSize: 18,
                                    color: AppColors.primaryText,
                                  ),
                            ),
                          ],
                        ),
                        Icon(
                          _isApproved
                              ? Icons.check_circle_rounded
                              : Icons.cancel_rounded,
                          color: _isApproved
                              ? const Color(0xFFDDF6E5)
                              : const Color(0xFFFFB4AB),
                          size: 52,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0x1A7C9CB4),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0x4D7C9CB4),
                    width: 1.2,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.lightbulb_outline_rounded,
                      color: Color(0xFF7C9CB4),
                      size: 30,
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dica de Estudo',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  color: const Color(0xFF7C9CB4),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'A media aritmetica e a soma de varios valores '
                            'dividida pela quantidade de valores somados.',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: AppColors.primaryText,
                                  fontSize: 16,
                                  height: 1.3,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GradeInput extends StatelessWidget {
  const _GradeInput({
    required this.label,
    required this.icon,
    required this.controller,
  });

  final String label;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.secondaryText,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 42 / 2,
            color: AppColors.primaryText,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: '0.0',
            hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 42 / 2,
              color: AppColors.secondaryText,
            ),
            prefixIcon: Icon(icon, color: AppColors.secondaryText, size: 30),
            filled: true,
            fillColor: AppColors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: AppColors.border, width: 1.1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: AppColors.border, width: 1.1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
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

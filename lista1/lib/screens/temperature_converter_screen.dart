import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({super.key});

  @override
  State<TemperatureConverterScreen> createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState
    extends State<TemperatureConverterScreen> {
  final TextEditingController _celsiusController = TextEditingController(
    text: '25',
  );
  double _fahrenheit = 77;

  @override
  void dispose() {
    _celsiusController.dispose();
    super.dispose();
  }

  void _convertToFahrenheit() {
    final input = _celsiusController.text.trim().replaceAll(',', '.');
    final celsius = double.tryParse(input);

    if (celsius == null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Digite um valor numerico valido.')),
        );
      return;
    }

    setState(() {
      _fahrenheit = (celsius * 9 / 5) + 32;
    });
  }

  String get _formattedFahrenheit => '${_fahrenheit.toStringAsFixed(1)} °F';

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
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.history_rounded,
                      color: AppColors.secondaryText,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Temperatura',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 60,
                  height: 1.05,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Converta Celsius para Fahrenheit instantaneamente',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 17,
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 42),
              Text(
                'Graus Celsius',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.primaryText,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _celsiusController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                        signed: true,
                      ),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryText,
                      ),
                      decoration: InputDecoration(
                        hintText: 'ex.: 25',
                        hintStyle: Theme.of(context).textTheme.titleLarge
                            ?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondaryText,
                            ),
                        prefixIcon: const Icon(
                          Icons.device_thermostat_rounded,
                          color: AppColors.secondaryText,
                          size: 28,
                        ),
                        filled: true,
                        fillColor: const Color(0xFF373642),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 22,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(44),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(44),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(44),
                          borderSide: const BorderSide(
                            color: AppColors.border,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.border, width: 2),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '°C',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 24,
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: AppColors.border, width: 1.6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.info_outlined,
                      size: 24,
                      color: AppColors.secondaryText,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'F = (C × 9/5) + 32',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 17,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                height: 74,
                child: FilledButton.icon(
                  onPressed: _convertToFahrenheit,
                  icon: const Icon(Icons.swap_vert_rounded, size: 30),
                  label: Text(
                    'Converter para Fahrenheit',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: const Color(0xFF0B3D85),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(38),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 44),
              Text(
                'Resultado',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 22,
                  color: AppColors.secondaryText,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 46,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(42),
                  border: Border.all(color: AppColors.border, width: 1.8),
                ),
                child: Column(
                  children: [
                    Text(
                      'Graus Fahrenheit',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 20,
                        color: AppColors.secondaryText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _formattedFahrenheit,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontSize: 68,
                            letterSpacing: -1,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFFB8DFFF),
                    width: 1.2,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.lightbulb_outline_rounded,
                      color: Color(0xFF1D71C4),
                      size: 30,
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        'A água congela a 0°C (32°F) e entra em ebulição a '
                        '100°C (212°F) na pressão atmosférica padrão.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF1D71C4),
                          fontSize: 16,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 42),
              Text(
                'Referência Rápida',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 22,
                  color: AppColors.secondaryText,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    child: _ReferenceCard(
                      title: 'Temp. Ambiente',
                      value: '20°C = 68°F',
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: _ReferenceCard(
                      title: 'Temp. Corporal',
                      value: '37°C = 98.6°F',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReferenceCard extends StatelessWidget {
  const _ReferenceCard({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.border, width: 1.6),
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.secondaryText,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../app_theme.dart';

class ExercisePlaceholderScreen extends StatelessWidget {
  const ExercisePlaceholderScreen({super.key, required this.titulo});

  final String titulo;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(titulo),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(spacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.construction_rounded,
                size: 48,
                color: palette.secondaryText,
              ),
              SizedBox(height: spacing.sm + spacing.xs),
              Text(
                'Tela em construcao',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: spacing.sm),
              Text(
                'Aqui voce pode implementar o exercicio "$titulo".',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

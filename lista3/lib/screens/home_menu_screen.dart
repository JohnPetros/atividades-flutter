import 'package:flutter/material.dart';

import 'attendance_list_screen.dart';
import 'expense_manager_screen.dart';
import 'inventory_control_screen.dart';
import 'user_profile_screen.dart';

class HomeMenuScreen extends StatelessWidget {
  const HomeMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Header(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _SectionHint(),
                    const SizedBox(height: 8),
                    _ExerciseCard(
                      icon: Icons.person_rounded,
                      title: 'Perfil de Usuario',
                      subtitle: 'Exercicio 1',
                      tech: 'JSON',
                      techColor: const Color(0xFFF59E0B),
                      badgeBackground: const Color(0x1AF59E0B),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const UserProfileScreen(),
                          ),
                        );
                      },
                    ),
                    _ExerciseCard(
                      icon: Icons.payments_rounded,
                      title: 'Gerenciador de Despesas',
                      subtitle: 'Exercicio 2',
                      tech: 'JSON',
                      techColor: const Color(0xFFF59E0B),
                      badgeBackground: const Color(0x1AF59E0B),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const ExpenseManagerScreen(),
                          ),
                        );
                      },
                    ),
                    _ExerciseCard(
                      icon: Icons.assignment_ind_rounded,
                      title: 'Lista de Presenca',
                      subtitle: 'Exercicio 3',
                      tech: 'SQLite',
                      techColor: const Color(0xFF4FC3F7),
                      badgeBackground: const Color(0x1A4FC3F7),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const AttendanceListScreen(),
                          ),
                        );
                      },
                    ),
                    _ExerciseCard(
                      icon: Icons.inventory_2_rounded,
                      title: 'Controle de Estoque',
                      subtitle: 'Exercicio 4',
                      tech: 'SQLite',
                      techColor: const Color(0xFF4FC3F7),
                      badgeBackground: const Color(0x1A4FC3F7),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const InventoryControlScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    const _DatabaseStatus(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2C42),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Persistencia Local',
            style: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          Text(
            'Laboratorio de Praticas Mobile',
            style: textTheme.bodyMedium?.copyWith(color: const Color(0xFF8EACC8)),
          ),
        ],
      ),
    );
  }
}

class _SectionHint extends StatelessWidget {
  const _SectionHint();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.school_rounded, size: 18, color: Color(0xFF8EACC8)),
          const SizedBox(width: 8),
          Text(
            'Escolha um exercicio para comecar',
            style: textTheme.labelLarge?.copyWith(
              color: const Color(0xFF8EACC8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExerciseCard extends StatelessWidget {
  const _ExerciseCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.tech,
    required this.techColor,
    required this.badgeBackground,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String tech;
  final Color techColor;
  final Color badgeBackground;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2C42),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2A4A6B)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x144FC3F7),
            offset: Offset(0, 2),
            blurRadius: 12,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D1B2A),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF2A4A6B)),
                  ),
                  alignment: Alignment.center,
                  child: Icon(icon, color: const Color(0xFF4FC3F7), size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            subtitle,
                            style: textTheme.bodySmall?.copyWith(color: const Color(0xFF8EACC8)),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: badgeBackground,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '▸ $tech',
                              style: textTheme.labelSmall?.copyWith(
                                color: techColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: Color(0xFF4FC3F7), size: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DatabaseStatus extends StatelessWidget {
  const _DatabaseStatus();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Text(
            'Status do Banco de Dados',
            style: textTheme.bodySmall?.copyWith(color: const Color(0xFF8EACC8)),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF66BB6A),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'SQLite Engine: Online',
                style: textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF66BB6A),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

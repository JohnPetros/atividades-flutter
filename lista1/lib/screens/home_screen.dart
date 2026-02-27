import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<_MenuSection> _sections = [
    _MenuSection(
      title: 'CALCULADORAS',
      items: [
        _MenuItem(
          title: 'Conversor de Temperatura',
          subtitle: 'Converta Celsius para Fahrenheit com suporte à fórmula',
          icon: Icons.device_thermostat_rounded,
          routeName: '/temperature',
        ),
        _MenuItem(
          title: 'Calculadora de Média',
          subtitle: 'Calcule a média aritmética de três notas',
          icon: Icons.functions_rounded,
          routeName: '/average',
        ),
        _MenuItem(
          title: 'Calculadora de Desconto',
          subtitle: 'Preço final com desconto e histórico de produtos',
          icon: Icons.sell_rounded,
          routeName: '/discount',
        ),
        _MenuItem(
          title: 'Calculadora de Área',
          subtitle: 'Cálculo da área de retângulo (L x A)',
          icon: Icons.square_foot_rounded,
          routeName: '/area',
        ),
      ],
    ),
    _MenuSection(
      title: 'ORGANIZAÇÃO',
      items: [
        _MenuItem(
          title: 'Lista de Compras',
          subtitle: 'Gerencie itens com marcação e remoção',
          icon: Icons.shopping_cart_rounded,
          routeName: '/shopping',
        ),
        _MenuItem(
          title: 'Tarefas Diárias',
          subtitle: 'Cadastro de tarefas com prioridade e descrição',
          icon: Icons.assignment_rounded,
          routeName: '/tasks',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          children: [
            const _Header(),
            const SizedBox(height: 24),
            const _WelcomeCard(),
            const SizedBox(height: 26),
            for (final section in _sections) ...[
              Text(
                section.title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 12),
              for (final item in section.items)
                _MenuCard(
                  item: item,
                  onTap: () => Navigator.of(context).pushNamed(item.routeName),
                ),
              const SizedBox(height: 24),
            ],
            Text(
              'v1.0.4 • Projeto Acadêmico',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 12,
                color: AppColors.hintText,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'EduCalc & Tarefas',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 26,
                letterSpacing: -0.4,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Kit Acadêmico',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.border, width: 1.6),
          ),
          child: const Icon(
            Icons.school_rounded,
            color: AppColors.primaryText,
            size: 28,
          ),
        ),
      ],
    );
  }
}

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(34),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bem-vindo(a)!',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 22,
              color: AppColors.welcomeText,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Escolha um módulo abaixo para começar a calcular ou organizar '
            'suas tarefas acadêmicas.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.welcomeText.withValues(alpha: 0.9),
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  const _MenuCard({required this.item, required this.onTap});

  final _MenuItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Material(
        color: AppColors.surface,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.border, width: 1.6),
          borderRadius: BorderRadius.circular(30),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 16, 20),
            child: Row(
              children: [
                SizedBox(
                  width: 38,
                  child: Icon(item.icon, color: AppColors.primary, size: 30),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 22,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item.subtitle,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.secondaryText,
                          fontSize: 15,
                          height: 1.28,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.primaryText,
                  size: 34,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuSection {
  const _MenuSection({required this.title, required this.items});

  final String title;
  final List<_MenuItem> items;
}

class _MenuItem {
  const _MenuItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.routeName,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String routeName;
}

import 'package:flutter/material.dart';

import '../app_theme.dart';

class PaisesCapitaisScreen extends StatefulWidget {
  const PaisesCapitaisScreen({super.key});

  @override
  State<PaisesCapitaisScreen> createState() => _PaisesCapitaisScreenState();
}

class _PaisesCapitaisScreenState extends State<PaisesCapitaisScreen> {
  static const List<_PaisCapital> _paises = [
    _PaisCapital(nome: 'Brasil', capital: 'Brasilia', codigo: 'BR'),
    _PaisCapital(nome: 'Belgica', capital: 'Bruxelas', codigo: 'BE'),
    _PaisCapital(nome: 'Benin', capital: 'Porto-Novo', codigo: 'BJ'),
    _PaisCapital(nome: 'Japao', capital: 'Toquio', codigo: 'JP'),
    _PaisCapital(nome: 'Franca', capital: 'Paris', codigo: 'FR'),
  ];

  final TextEditingController _buscaController = TextEditingController(
    text: 'B',
  );

  _PaisCapital? _paisSelecionado = _paises.first;
  String _consulta = 'B';

  @override
  void dispose() {
    _buscaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;
    final radii = context.radii;

    final sugestoes = _filtrarSugestoes();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFF0D0D0D), palette.background],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              spacing.md,
              spacing.sm,
              spacing.md,
              spacing.xl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TopBar(onBack: () => Navigator.of(context).pop()),
                SizedBox(height: spacing.lg),
                _IntroCard(),
                SizedBox(height: spacing.lg),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(spacing.md),
                  decoration: BoxDecoration(
                    color: const Color(0xFF131313),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: palette.divider),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.search_rounded,
                            size: 20,
                            color: palette.primaryText,
                          ),
                          SizedBox(width: spacing.sm),
                          Text(
                            'Selecione um Pais',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height: spacing.md),
                      TextField(
                        controller: _buscaController,
                        onChanged: (valor) {
                          setState(() => _consulta = valor);
                        },
                        style: Theme.of(context).textTheme.bodyLarge,
                        decoration: InputDecoration(
                          hintText: 'Comece a digitar o nome do pais...',
                          hintStyle: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: palette.hint),
                          prefixIcon: Icon(
                            Icons.flag_outlined,
                            color: palette.secondaryText,
                          ),
                          filled: true,
                          fillColor: const Color(0xFF0A0A0A),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: spacing.md,
                            vertical: spacing.sm + spacing.xs,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: palette.divider),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: palette.divider),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.white.withValues(alpha: 0.7),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: spacing.xs + 2),
                      Text(
                        'Ex: Brasil, Japao, Franca...',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(height: spacing.sm + spacing.xs),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF0B0B0B),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: palette.divider),
                        ),
                        child: sugestoes.isEmpty
                            ? Padding(
                                padding: EdgeInsets.all(spacing.md),
                                child: Text(
                                  'Nenhum pais encontrado.',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              )
                            : Column(
                                children: [
                                  for (int i = 0; i < sugestoes.length; i++)
                                    InkWell(
                                      onTap: () =>
                                          _selecionarPais(sugestoes[i]),
                                      borderRadius: BorderRadius.circular(
                                        radii.md,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: spacing.md,
                                          vertical: spacing.sm + spacing.xs,
                                        ),
                                        decoration: BoxDecoration(
                                          border: i == sugestoes.length - 1
                                              ? null
                                              : Border(
                                                  bottom: BorderSide(
                                                    color: palette.divider,
                                                  ),
                                                ),
                                        ),
                                        child: Row(
                                          children: [
                                            _CodigoBadge(
                                              codigo: sugestoes[i].codigo,
                                            ),
                                            SizedBox(width: spacing.sm + 2),
                                            Expanded(
                                              child: Text(
                                                sugestoes[i].nome,
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.bodyLarge,
                                              ),
                                            ),
                                            if (_paisSelecionado?.nome ==
                                                sugestoes[i].nome)
                                              Icon(
                                                Icons.check_circle_rounded,
                                                size: 18,
                                                color: palette.accent,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                      ),
                      SizedBox(height: spacing.md),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(spacing.md),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0C0C0C),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: palette.divider),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_city_outlined,
                                  size: 20,
                                  color: palette.primaryText,
                                ),
                                SizedBox(width: spacing.sm),
                                Text(
                                  'Capital Encontrada',
                                  style: Theme.of(context).textTheme.labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            SizedBox(height: spacing.md),
                            Text(
                              _paisSelecionado?.capital ?? '---',
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: spacing.xs),
                            Text(
                              _paisSelecionado == null
                                  ? 'Selecione um pais para visualizar a capital.'
                                  : 'Esta e a sede administrativa do pais selecionado.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: spacing.md),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: _limparSelecao,
                          icon: const Icon(Icons.rotate_left_rounded),
                          label: const Text('Limpar Selecao'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: palette.primaryText,
                            side: BorderSide(color: palette.divider),
                            backgroundColor: palette.transparent,
                            padding: EdgeInsets.symmetric(vertical: spacing.md),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(radii.full),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: spacing.md),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(spacing.md),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF3FF),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFCADFFF)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Icon(
                          Icons.lightbulb_outline_rounded,
                          color: Color(0xFF1D4ED8),
                          size: 20,
                        ),
                      ),
                      SizedBox(width: spacing.sm),
                      Expanded(
                        child: Text(
                          'O widget Autocomplete e ideal para longas listas de opcoes, permitindo que o usuario filtre resultados enquanto digita.',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: const Color(0xFF1E3A8A)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<_PaisCapital> _filtrarSugestoes() {
    final consulta = _consulta.trim().toLowerCase();
    if (consulta.isEmpty) {
      return _paises;
    }

    return _paises
        .where((pais) => pais.nome.toLowerCase().startsWith(consulta))
        .toList();
  }

  void _selecionarPais(_PaisCapital pais) {
    setState(() {
      _paisSelecionado = pais;
      _consulta = pais.nome;
      _buscaController
        ..text = pais.nome
        ..selection = TextSelection.collapsed(offset: pais.nome.length);
    });
  }

  void _limparSelecao() {
    setState(() {
      _consulta = '';
      _paisSelecionado = null;
      _buscaController.clear();
    });
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Row(
      children: [
        IconButton(
          onPressed: onBack,
          icon: const Icon(Icons.arrow_back_rounded),
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xFF181818),
            foregroundColor: palette.primaryText,
            minimumSize: const Size(42, 42),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Exercicio 08',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: palette.secondaryText,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.info_outline_rounded),
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xFF181818),
            foregroundColor: palette.primaryText,
            minimumSize: const Size(42, 42),
          ),
        ),
        SizedBox(width: spacing.xs),
      ],
    );
  }
}

class _IntroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.public_rounded,
            color: Color(0xFF0F172A),
            size: 24,
          ),
        ),
        SizedBox(width: spacing.sm + 2),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Paises e Capitais',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: spacing.xs),
              Text(
                'Pratique o uso de campos Autocomplete e exibicao de dados vinculados.',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: palette.secondaryText),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CodigoBadge extends StatelessWidget {
  const _CodigoBadge({required this.codigo});

  final String codigo;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: palette.divider),
      ),
      alignment: Alignment.center,
      child: Text(
        codigo,
        style: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(color: palette.secondaryText),
      ),
    );
  }
}

class _PaisCapital {
  const _PaisCapital({
    required this.nome,
    required this.capital,
    required this.codigo,
  });

  final String nome;
  final String capital;
  final String codigo;
}

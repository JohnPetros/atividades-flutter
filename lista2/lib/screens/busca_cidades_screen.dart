import 'package:flutter/material.dart';

import '../app_theme.dart';

class BuscaCidadesScreen extends StatefulWidget {
  const BuscaCidadesScreen({super.key});

  @override
  State<BuscaCidadesScreen> createState() => _BuscaCidadesScreenState();
}

class _BuscaCidadesScreenState extends State<BuscaCidadesScreen> {
  final TextEditingController _cidadeController = TextEditingController(
    text: 'Ri',
  );

  final List<_Cidade> _cidades = const [
    _Cidade(nome: 'Rio de Janeiro', uf: 'RJ', estado: 'Rio de Janeiro'),
    _Cidade(nome: 'Ribeirao Preto', uf: 'SP', estado: 'Sao Paulo'),
    _Cidade(nome: 'Rio Branco', uf: 'AC', estado: 'Acre'),
    _Cidade(nome: 'Curitiba', uf: 'PR', estado: 'Parana'),
    _Cidade(nome: 'Sao Paulo', uf: 'SP', estado: 'Sao Paulo'),
    _Cidade(nome: 'Recife', uf: 'PE', estado: 'Pernambuco'),
  ];

  late _Cidade _cidadeSelecionada;

  @override
  void initState() {
    super.initState();
    _cidadeSelecionada = _cidades.first;
  }

  @override
  void dispose() {
    _cidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    final sugestoes = _filtrarCidades(_cidadeController.text).take(3).toList();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFF0D1014), palette.background],
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
                _TopArea(onBack: () => Navigator.of(context).pop()),
                SizedBox(height: spacing.lg),
                _SearchCard(
                  controller: _cidadeController,
                  sugestoes: sugestoes,
                  onChanged: (_) => setState(() {}),
                  onSelectCity: (cidade) {
                    setState(() {
                      _cidadeSelecionada = cidade;
                      _cidadeController
                        ..text = cidade.nome
                        ..selection = TextSelection.collapsed(
                          offset: cidade.nome.length,
                        );
                    });
                  },
                ),
                SizedBox(height: spacing.lg),
                _ResultadoHeader(temSelecao: true),
                SizedBox(height: spacing.sm + spacing.xs),
                _CidadeSelecionadaCard(cidade: _cidadeSelecionada),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<_Cidade> _filtrarCidades(String termo) {
    final pesquisa = termo.trim().toLowerCase();
    if (pesquisa.isEmpty) {
      return _cidades;
    }

    return _cidades
        .where(
          (cidade) =>
              cidade.nome.toLowerCase().contains(pesquisa) ||
              cidade.uf.toLowerCase().contains(pesquisa),
        )
        .toList();
  }
}

class _TopArea extends StatelessWidget {
  const _TopArea({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.sm),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF171A1F), Color(0xFF0E1116)],
        ),
        border: Border.all(color: palette.divider),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back_rounded),
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xFF0C0F14),
              foregroundColor: palette.primaryText,
              minimumSize: const Size(42, 42),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: BorderSide(color: palette.divider),
            ),
          ),
          SizedBox(width: spacing.sm + spacing.xs),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: spacing.xs),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Busca de Cidades',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: spacing.xs),
                  Text(
                    'Exercicio de Autocomplete e Filtros',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchCard extends StatelessWidget {
  const _SearchCard({
    required this.controller,
    required this.sugestoes,
    required this.onChanged,
    required this.onSelectCity,
  });

  final TextEditingController controller;
  final List<_Cidade> sugestoes;
  final ValueChanged<String> onChanged;
  final ValueChanged<_Cidade> onSelectCity;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFF12161C),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: palette.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pesquisar Municipio',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: spacing.sm + spacing.xs),
          TextField(
            controller: controller,
            onChanged: onChanged,
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: InputDecoration(
              hintText: 'Ex: Sao Paulo, Curitiba...',
              prefixIcon: Icon(
                Icons.search_rounded,
                color: palette.secondaryText,
              ),
              filled: true,
              fillColor: const Color(0xFF0A0E13),
              contentPadding: EdgeInsets.symmetric(
                horizontal: spacing.md,
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
                borderSide: BorderSide(color: palette.accent, width: 1.15),
              ),
            ),
          ),
          SizedBox(height: spacing.sm + spacing.xs),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF0D1218),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: palette.divider),
            ),
            child: Column(
              children: [
                for (int i = 0; i < sugestoes.length; i++)
                  InkWell(
                    onTap: () => onSelectCity(sugestoes[i]),
                    borderRadius: i == 0
                        ? const BorderRadius.vertical(top: Radius.circular(18))
                        : i == sugestoes.length - 1
                        ? const BorderRadius.vertical(
                            bottom: Radius.circular(18),
                          )
                        : BorderRadius.zero,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: spacing.md,
                        vertical: spacing.md - 2,
                      ),
                      decoration: BoxDecoration(
                        border: i == sugestoes.length - 1
                            ? null
                            : Border(
                                bottom: BorderSide(
                                  color: palette.divider.withValues(
                                    alpha: 0.65,
                                  ),
                                ),
                              ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            i == 0
                                ? Icons.history_rounded
                                : Icons.place_outlined,
                            size: 18,
                            color: palette.secondaryText,
                          ),
                          SizedBox(width: spacing.sm + spacing.xs),
                          Expanded(
                            child: Text(
                              '${sugestoes[i].nome}, ${sugestoes[i].uf}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (sugestoes.isEmpty)
                  Padding(
                    padding: EdgeInsets.all(spacing.md),
                    child: Text(
                      'Nenhum municipio encontrado',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: palette.secondaryText,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultadoHeader extends StatelessWidget {
  const _ResultadoHeader({required this.temSelecao});

  final bool temSelecao;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Row(
      children: [
        Expanded(
          child: Text(
            'Resultado da Selecao',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: spacing.sm + spacing.xs,
            vertical: spacing.xs,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF111A14),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: palette.divider),
          ),
          child: Row(
            children: [
              Icon(Icons.check_rounded, size: 14, color: palette.success),
              SizedBox(width: spacing.xs),
              Text(
                temSelecao ? '1 selecionada' : '0 selecionadas',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(color: palette.primaryText),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CidadeSelecionadaCard extends StatelessWidget {
  const _CidadeSelecionadaCard({required this.cidade});

  final _Cidade cidade;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFF12161D),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: palette.divider),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF0A0F14),
              border: Border.all(color: palette.divider),
            ),
            child: Icon(
              Icons.location_city_rounded,
              size: 22,
              color: palette.secondaryText,
            ),
          ),
          SizedBox(width: spacing.sm + spacing.xs),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cidade.nome,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: spacing.xs),
                Text(
                  'Estado do ${cidade.estado} - Brasil',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right_rounded, size: 24, color: palette.hint),
        ],
      ),
    );
  }
}

class _Cidade {
  const _Cidade({required this.nome, required this.uf, required this.estado});

  final String nome;
  final String uf;
  final String estado;
}

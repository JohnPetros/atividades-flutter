import 'package:flutter/material.dart';

import '../app_theme.dart';

class CatalogoProdutosScreen extends StatefulWidget {
  const CatalogoProdutosScreen({super.key});

  @override
  State<CatalogoProdutosScreen> createState() => _CatalogoProdutosScreenState();
}

class _CatalogoProdutosScreenState extends State<CatalogoProdutosScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _pesquisaController = TextEditingController();

  late final TabController _tabController;

  static const List<String> _categorias = [
    'Eletronicos',
    'Vestuario',
    'Livros',
    'Casa',
  ];

  static const List<_Produto> _produtos = [
    _Produto(
      nome: 'MacBook Air M2',
      descricao: 'Apple, 8GB RAM, 256GB SSD',
      preco: 'R\$ 7.999',
      icone: Icons.laptop_mac_outlined,
      categoria: 'Eletronicos',
    ),
    _Produto(
      nome: 'iPhone 15 Pro',
      descricao: 'Titanio Natural, 128GB',
      preco: 'R\$ 6.490',
      icone: Icons.smartphone_outlined,
      categoria: 'Eletronicos',
    ),
    _Produto(
      nome: 'Sony WH-1000XM5',
      descricao: 'Cancelamento de ruido ativo',
      preco: 'R\$ 2.150',
      icone: Icons.headphones_outlined,
      categoria: 'Eletronicos',
    ),
    _Produto(
      nome: 'Apple Watch Series 9',
      descricao: 'GPS + Cellular, 45mm',
      preco: 'R\$ 3.800',
      icone: Icons.watch_outlined,
      categoria: 'Eletronicos',
    ),
    _Produto(
      nome: 'Galaxy Tab S9 Ultra',
      descricao: '14.6 polegadas, S-Pen inclusa',
      preco: 'R\$ 5.200',
      icone: Icons.tablet_mac_outlined,
      categoria: 'Eletronicos',
    ),
    _Produto(
      nome: 'JBL Flip 6',
      descricao: "Caixa de som Bluetooth a prova d'agua",
      preco: 'R\$ 699',
      icone: Icons.speaker_outlined,
      categoria: 'Eletronicos',
    ),
    _Produto(
      nome: 'Canon EOS R6',
      descricao: 'Mirrorless Full Frame',
      preco: 'R\$ 14.500',
      icone: Icons.photo_camera_outlined,
      categoria: 'Eletronicos',
    ),
    _Produto(
      nome: 'Logitech MX Master 3S',
      descricao: 'Mouse ergonomico silencioso',
      preco: 'R\$ 540',
      icone: Icons.mouse_outlined,
      categoria: 'Eletronicos',
    ),
    _Produto(
      nome: 'Camiseta Basica',
      descricao: 'Algodao premium, modelagem regular',
      preco: 'R\$ 89',
      icone: Icons.checkroom_outlined,
      categoria: 'Vestuario',
    ),
    _Produto(
      nome: 'Tenis Runner Pro',
      descricao: 'Amortecimento leve para treino diario',
      preco: 'R\$ 399',
      icone: Icons.directions_run_outlined,
      categoria: 'Vestuario',
    ),
    _Produto(
      nome: 'Flutter para Iniciantes',
      descricao: 'Guia pratico com projetos em Dart',
      preco: 'R\$ 129',
      icone: Icons.menu_book_outlined,
      categoria: 'Livros',
    ),
    _Produto(
      nome: 'Design de Interfaces Moveis',
      descricao: 'Principios de UX para apps modernos',
      preco: 'R\$ 149',
      icone: Icons.auto_stories_outlined,
      categoria: 'Livros',
    ),
    _Produto(
      nome: 'Luminaria de Mesa LED',
      descricao: 'Luz quente e fria com ajuste de intensidade',
      preco: 'R\$ 179',
      icone: Icons.light_outlined,
      categoria: 'Casa',
    ),
    _Produto(
      nome: 'Organizador Modular',
      descricao: 'Kit com 4 caixas empilhaveis',
      preco: 'R\$ 239',
      icone: Icons.inventory_2_outlined,
      categoria: 'Casa',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categorias.length, vsync: this)
      ..addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController
      ..removeListener(_handleTabChange)
      ..dispose();
    _pesquisaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    final categoriaAtual = _categorias[_tabController.index];
    final quantidadeResultados = _filtrarProdutos(categoriaAtual).length;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0D1014), Color(0xFF050608)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  spacing.md,
                  spacing.sm,
                  spacing.md,
                  spacing.sm,
                ),
                child: _TopBar(onBack: () => Navigator.of(context).pop()),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing.md),
                child: _SearchField(
                  controller: _pesquisaController,
                  onChanged: (_) => setState(() {}),
                ),
              ),
              SizedBox(height: spacing.md),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing.md),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelColor: palette.primaryText,
                    unselectedLabelColor: palette.secondaryText,
                    labelStyle: Theme.of(context).textTheme.labelLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                    unselectedLabelStyle: Theme.of(
                      context,
                    ).textTheme.labelLarge,
                    indicatorColor: palette.primaryText,
                    indicatorWeight: 2.4,
                    indicatorSize: TabBarIndicatorSize.label,
                    dividerColor: palette.transparent,
                    tabs: const [
                      Tab(text: 'Eletronicos'),
                      Tab(text: 'Vestuario'),
                      Tab(text: 'Livros'),
                      Tab(text: 'Casa'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: spacing.sm),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing.md),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Resultados em $categoriaAtual',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: palette.secondaryText,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: spacing.sm + spacing.xs),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: _categorias
                      .map(
                        (categoria) => _ProductsList(
                          produtos: _filtrarProdutos(categoria),
                        ),
                      )
                      .toList(growable: false),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(
                  spacing.md,
                  spacing.sm,
                  spacing.md,
                  spacing.md,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: spacing.md,
                  vertical: spacing.sm + 2,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F1319),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: palette.divider),
                ),
                child: Text(
                  '$quantidadeResultados produtos encontrados',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: palette.secondaryText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<_Produto> _filtrarProdutos(String categoria) {
    final termo = _pesquisaController.text.trim().toLowerCase();
    return _produtos
        .where((produto) {
          final mesmaCategoria = produto.categoria == categoria;
          final combinaBusca =
              termo.isEmpty ||
              produto.nome.toLowerCase().contains(termo) ||
              produto.descricao.toLowerCase().contains(termo);
          return mesmaCategoria && combinaBusca;
        })
        .toList(growable: false);
  }

  void _handleTabChange() {
    if (!_tabController.indexIsChanging) {
      setState(() {});
    }
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Row(
      children: [
        IconButton(
          onPressed: onBack,
          icon: const Icon(Icons.arrow_back_rounded),
          style: IconButton.styleFrom(
            minimumSize: const Size(40, 40),
            backgroundColor: const Color(0xFF10141B),
            foregroundColor: palette.primaryText,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: BorderSide(color: palette.divider),
          ),
        ),
        const Spacer(),
        Text(
          'Catalogo de Produtos',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_outlined),
          style: IconButton.styleFrom(
            minimumSize: const Size(40, 40),
            backgroundColor: const Color(0xFF10141B),
            foregroundColor: palette.primaryText,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: BorderSide(color: palette.divider),
          ),
        ),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.controller, required this.onChanged});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: 'Pesquisar no catalogo...',
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: palette.hint),
        prefixIcon: Icon(Icons.search_rounded, color: palette.secondaryText),
        filled: true,
        fillColor: const Color(0xFF121721),
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacing.md,
          vertical: spacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: palette.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: palette.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: palette.accent, width: 1.3),
        ),
      ),
    );
  }
}

class _ProductsList extends StatelessWidget {
  const _ProductsList({required this.produtos});

  final List<_Produto> produtos;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    if (produtos.isEmpty) {
      return Center(
        child: Text(
          'Nenhum produto encontrado',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.fromLTRB(
        spacing.md,
        spacing.xs,
        spacing.md,
        spacing.sm,
      ),
      itemCount: produtos.length,
      separatorBuilder: (_, _) => SizedBox(height: spacing.sm + spacing.xs),
      itemBuilder: (context, index) => _ProductCard(produto: produtos[index]),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.produto});

  final _Produto produto;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final spacing = context.spacing;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF11161F),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: palette.divider),
      ),
      padding: EdgeInsets.all(spacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFF0B0F14),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: palette.divider),
            ),
            alignment: Alignment.center,
            child: Icon(produto.icone, size: 28, color: palette.primaryText),
          ),
          SizedBox(width: spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  produto.nome,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: spacing.xs + 2),
                Text(
                  produto.descricao,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: palette.secondaryText,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: spacing.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                produto.preco,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: spacing.xs + 2),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: spacing.sm,
                  vertical: spacing.xs,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFB9F6CA),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  'Em estoque',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: const Color(0xFF0F5132),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Produto {
  const _Produto({
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.icone,
    required this.categoria,
  });

  final String nome;
  final String descricao;
  final String preco;
  final IconData icone;
  final String categoria;
}

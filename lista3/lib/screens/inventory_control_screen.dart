import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class InventoryControlScreen extends StatefulWidget {
  const InventoryControlScreen({super.key});

  @override
  State<InventoryControlScreen> createState() => _InventoryControlScreenState();
}

class _InventoryControlScreenState extends State<InventoryControlScreen> {
  static const _databaseName = 'local_persistence.db';
  static const _tableName = 'estoque';

  final _productController = TextEditingController();
  final _quantityController = TextEditingController();

  Database? _database;
  final List<_InventoryItem> _items = <_InventoryItem>[];
  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadInventory();
  }

  @override
  void dispose() {
    _productController.dispose();
    _quantityController.dispose();
    _database?.close();
    super.dispose();
  }

  Future<Database> _getDatabase() async {
    if (_database != null) {
      return _database!;
    }

    final databasesPath = await getDatabasesPath();
    final path = p.join(databasesPath, _databaseName);
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $_tableName('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'nome_produto TEXT NOT NULL,'
          'quantidade INTEGER NOT NULL'
          ')',
        );
      },
    );

    return _database!;
  }

  Future<void> _loadInventory() async {
    try {
      final db = await _getDatabase();
      final result = await db.query(
        _tableName,
        orderBy: 'id DESC',
      );

      if (!mounted) {
        return;
      }

      setState(() {
        _items
          ..clear()
          ..addAll(result.map(_InventoryItem.fromMap));
      });
    } catch (_) {
      if (!mounted) {
        return;
      }
      _showMessage('Erro ao carregar estoque.', isError: true);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _registerProduct() async {
    FocusScope.of(context).unfocus();

    final productName = _productController.text.trim();
    final quantityText = _quantityController.text.trim();
    final quantity = int.tryParse(quantityText);

    if (productName.isEmpty || quantityText.isEmpty) {
      _showMessage('Nome do produto e quantidade sao obrigatorios.', isError: true);
      return;
    }

    if (quantity == null || quantity <= 0) {
      _showMessage('Quantidade deve ser um numero inteiro positivo.', isError: true);
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final db = await _getDatabase();
      await db.insert(_tableName, {
        'nome_produto': productName,
        'quantidade': quantity,
      });

      _productController.clear();
      _quantityController.clear();
      await _loadInventory();

      if (!mounted) {
        return;
      }
      _showMessage('Produto cadastrado no SQLite!');
    } catch (_) {
      if (!mounted) {
        return;
      }
      _showMessage('Erro ao cadastrar produto.', isError: true);
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  void _showMessage(String message, {bool isError = false}) {
    final messenger = ScaffoldMessenger.of(context);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                isError ? Icons.error_outline_rounded : Icons.check_circle_rounded,
                color: isError ? Colors.white : const Color(0xFF66BB6A),
                size: 20,
              ),
              const SizedBox(width: 10),
              Expanded(child: Text(message)),
            ],
          ),
          backgroundColor:
              isError ? Theme.of(context).colorScheme.error : const Color(0xFF1A2C42),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF1A2C42),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Color(0xFF4FC3F7),
                          size: 24,
                        ),
                      ),
                      Text('Controle de Estoque', style: textTheme.titleMedium),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0x1A4FC3F7),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      '▸ SQLite',
                      style: textTheme.labelSmall?.copyWith(
                        color: const Color(0xFF4FC3F7),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                _InventoryInputField(
                                  label: 'Nome do produto',
                                  hint: 'Ex: Caneta azul',
                                  controller: _productController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                ),
                                const SizedBox(height: 24),
                                _InventoryInputField(
                                  label: 'Quantidade',
                                  hint: '0',
                                  controller: _quantityController,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  onSubmitted: (_) {
                                    if (!_isSaving) {
                                      _registerProduct();
                                    }
                                  },
                                ),
                                const SizedBox(height: 24),
                                ElevatedButton.icon(
                                  onPressed: _isSaving ? null : _registerProduct,
                                  icon: _isSaving
                                      ? const SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: CircularProgressIndicator(strokeWidth: 2),
                                        )
                                      : const Icon(Icons.add_rounded),
                                  label: Text(
                                    _isSaving ? 'Cadastrando...' : 'Cadastrar Produto',
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: const Color(0xFF0D1B2A),
                                    textStyle: textTheme.labelLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                            child: Row(
                              children: [
                                Text(
                                  'Estoque Atual',
                                  style: textTheme.labelLarge?.copyWith(
                                    color: const Color(0xFF8EACC8),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Expanded(
                                  child: Divider(
                                    color: Color(0xFF2A4A6B),
                                    thickness: 1,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1A2C42),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  child: Text(
                                    '${_items.length} Itens',
                                    style: textTheme.labelSmall?.copyWith(
                                      color: const Color(0xFF4FC3F7),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (_items.isNotEmpty)
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFF2A4A6B)),
                              ),
                              child: Column(
                                children: _items
                                    .map(
                                      (item) => _InventoryItemTile(
                                        name: item.name,
                                        quantity: item.quantity,
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                          else
                            Container(
                              padding: const EdgeInsets.all(40),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.inventory_rounded,
                                    size: 48,
                                    color: const Color(0xFF2A4A6B),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Nenhum produto cadastrado',
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: const Color(0xFF8EACC8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(height: 40),
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

class _InventoryInputField extends StatelessWidget {
  const _InventoryInputField({
    required this.label,
    required this.hint,
    required this.controller,
    required this.keyboardType,
    required this.textInputAction,
    this.onSubmitted,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.labelMedium?.copyWith(color: const Color(0xFF8EACC8)),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onSubmitted: onSubmitted,
          style: textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: textTheme.bodyMedium?.copyWith(color: const Color(0xFF8EACC8)),
          ),
        ),
      ],
    );
  }
}

class _InventoryItemTile extends StatelessWidget {
  const _InventoryItemTile({
    required this.name,
    required this.quantity,
  });

  final String name;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: const Color(0xFF1A2C42),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      margin: const EdgeInsets.only(bottom: 1),
      child: Row(
        children: [
          const Icon(
            Icons.inventory_2_rounded,
            color: Color(0xFF8EACC8),
            size: 18,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodyMedium,
            ),
          ),
          Container(
            width: 1,
            height: 24,
            color: const Color(0xFF2A4A6B),
          ),
          const SizedBox(width: 12),
          Text(
            'Qtd:',
            style: textTheme.bodySmall?.copyWith(color: const Color(0xFF8EACC8)),
          ),
          const SizedBox(width: 4),
          Text(
            '$quantity',
            style: textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF4FC3F7),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _InventoryItem {
  const _InventoryItem({
    required this.name,
    required this.quantity,
  });

  final String name;
  final int quantity;

  factory _InventoryItem.fromMap(Map<String, Object?> map) {
    return _InventoryItem(
      name: (map['nome_produto'] as String? ?? '').trim(),
      quantity: map['quantidade'] as int? ?? 0,
    );
  }
}

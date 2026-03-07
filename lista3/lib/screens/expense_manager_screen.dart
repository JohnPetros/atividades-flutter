import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ExpenseManagerScreen extends StatefulWidget {
  const ExpenseManagerScreen({super.key});

  @override
  State<ExpenseManagerScreen> createState() => _ExpenseManagerScreenState();
}

class _ExpenseManagerScreenState extends State<ExpenseManagerScreen> {
  static const _expensesFileName = 'expenses.json';

  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  final List<_ExpenseItem> _expenses = <_ExpenseItem>[];

  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<File> _getExpensesFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}${Platform.pathSeparator}$_expensesFileName');
  }

  Future<void> _loadExpenses() async {
    try {
      final file = await _getExpensesFile();
      if (!await file.exists()) {
        return;
      }

      final content = await file.readAsString();
      if (content.trim().isEmpty) {
        return;
      }

      final decoded = jsonDecode(content);
      if (decoded is! List) {
        return;
      }

      final loaded = decoded
          .whereType<Map<String, dynamic>>()
          .map(_ExpenseItem.tryFromJson)
          .whereType<_ExpenseItem>()
          .toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

      if (!mounted) {
        return;
      }

      setState(() {
        _expenses
          ..clear()
          ..addAll(loaded);
      });
    } catch (_) {
      if (!mounted) {
        return;
      }
      _showMessage('Erro ao carregar gastos salvos.', isError: true);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _addExpense() async {
    FocusScope.of(context).unfocus();

    final description = _descriptionController.text.trim();
    final amount = _parseAmount(_amountController.text);

    if (description.isEmpty || _amountController.text.trim().isEmpty) {
      _showMessage('Descricao e valor sao obrigatorios.', isError: true);
      return;
    }

    if (amount == null || amount <= 0) {
      _showMessage('Informe um valor numerico positivo.', isError: true);
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final expense = _ExpenseItem(
        description: description,
        value: amount,
        createdAt: DateTime.now(),
      );

      final updated = <_ExpenseItem>[expense, ..._expenses];
      final file = await _getExpensesFile();
      await file.writeAsString(
        jsonEncode(updated.map((item) => item.toJson()).toList()),
      );

      if (!mounted) {
        return;
      }

      setState(() {
        _expenses
          ..clear()
          ..addAll(updated);
      });

      _descriptionController.clear();
      _amountController.clear();
      _showMessage('Despesa adicionada com sucesso!');
    } catch (_) {
      if (!mounted) {
        return;
      }
      _showMessage('Erro ao salvar despesa.', isError: true);
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  double? _parseAmount(String input) {
    final trimmed = input.trim();
    if (trimmed.isEmpty) {
      return null;
    }

    var normalized = trimmed.replaceAll(' ', '');

    if (normalized.contains(',') && normalized.contains('.')) {
      normalized = normalized.replaceAll('.', '').replaceAll(',', '.');
    } else {
      normalized = normalized.replaceAll(',', '.');
    }

    return double.tryParse(normalized);
  }

  String _formatCurrency(double value) {
    final fixed = value.toStringAsFixed(2);
    final parts = fixed.split('.');
    final integerPart = parts[0];
    final decimalPart = parts[1];
    final withSeparator = _formatThousands(integerPart);
    return 'R\$ $withSeparator,$decimalPart';
  }

  String _formatThousands(String digits) {
    final buffer = StringBuffer();
    for (var index = 0; index < digits.length; index++) {
      final reverseIndex = digits.length - index;
      buffer.write(digits[index]);
      if (reverseIndex > 1 && reverseIndex % 3 == 1) {
        buffer.write('.');
      }
    }
    return buffer.toString();
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final isToday =
        date.year == now.year && date.month == now.month && date.day == now.day;

    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    if (isToday) {
      return 'Hoje, $hour:$minute';
    }

    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/$hour:$minute';
  }

  void _showMessage(String message, {bool isError = false}) {
    final messenger = ScaffoldMessenger.of(context);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isError
              ? Theme.of(context).colorScheme.error
              : const Color(0xFF66BB6A),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _ExpenseHeader(onBack: () => Navigator.of(context).pop()),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _ExpenseFormCard(
                            descriptionController: _descriptionController,
                            amountController: _amountController,
                            isSaving: _isSaving,
                            onAdd: _addExpense,
                          ),
                          const SizedBox(height: 24),
                          _OverviewCard(expenses: _expenses),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Historico de Gastos',
                                style: textTheme.titleMedium?.copyWith(
                                  color: const Color(0xFF8EACC8),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1A2C42),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  '${_expenses.length} itens',
                                  style: textTheme.labelSmall?.copyWith(
                                    color: const Color(0xFF4FC3F7),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          if (_expenses.isEmpty)
                            _EmptyExpensesState(textTheme: textTheme)
                          else
                            Column(
                              children: _expenses
                                  .map(
                                    (expense) => _ExpenseTile(
                                      description: expense.description,
                                      dateLabel: _formatDate(expense.createdAt),
                                      valueLabel: _formatCurrency(expense.value),
                                    ),
                                  )
                                  .toList(),
                            ),
                          const SizedBox(height: 24),
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

class _ExpenseHeader extends StatelessWidget {
  const _ExpenseHeader({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: const Color(0xFF1A2C42),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onBack,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Color(0xFF4FC3F7),
                ),
              ),
              Text('Gerenciador de Despesas', style: textTheme.titleMedium),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0x1AF59E0B),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: const Color(0x44F59E0B)),
            ),
            child: Row(
              children: [
                const Icon(Icons.code_rounded, size: 14, color: Color(0xFFF59E0B)),
                const SizedBox(width: 4),
                Text(
                  'JSON',
                  style: textTheme.labelSmall?.copyWith(
                    color: const Color(0xFFF59E0B),
                    fontWeight: FontWeight.w700,
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

class _ExpenseFormCard extends StatelessWidget {
  const _ExpenseFormCard({
    required this.descriptionController,
    required this.amountController,
    required this.isSaving,
    required this.onAdd,
  });

  final TextEditingController descriptionController;
  final TextEditingController amountController;
  final bool isSaving;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2C42),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2A4A6B)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Descricao',
            style: textTheme.labelMedium?.copyWith(color: const Color(0xFF8EACC8)),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: descriptionController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'Ex: Almoco no Centro',
              prefixIcon: Icon(Icons.description_rounded),
              fillColor: Color(0xFF0D1B2A),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Valor (R\$)',
            style: textTheme.labelMedium?.copyWith(color: const Color(0xFF8EACC8)),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => onAdd(),
            decoration: const InputDecoration(
              hintText: '0,00',
              prefixIcon: Icon(Icons.payments_rounded),
              fillColor: Color(0xFF0D1B2A),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: isSaving ? null : onAdd,
            icon: isSaving
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.add_rounded),
            label: Text(isSaving ? 'Adicionando...' : 'Adicionar Despesa'),
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color(0xFFE8F0F7),
              textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _OverviewCard extends StatelessWidget {
  const _OverviewCard({required this.expenses});

  final List<_ExpenseItem> expenses;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bars = expenses.take(5).toList().reversed.toList();
    final maxValue = bars.isEmpty
        ? 1.0
        : bars.map((expense) => expense.value).reduce((a, b) => a > b ? a : b);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            'Visao Geral',
            style: textTheme.titleMedium?.copyWith(color: const Color(0xFF8EACC8)),
          ),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1A2C42),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF2A4A6B)),
          ),
          child: bars.isEmpty
              ? Center(
                  child: Text(
                    'Adicione despesas para visualizar o grafico.',
                    style: textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: bars
                      .map(
                        (expense) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      width: 24,
                                      height: (expense.value / maxValue) * 110 + 14,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF4FC3F7),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${expense.createdAt.day.toString().padLeft(2, '0')}/${expense.createdAt.month.toString().padLeft(2, '0')}',
                                  style: textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
        ),
      ],
    );
  }
}

class _EmptyExpensesState extends StatelessWidget {
  const _EmptyExpensesState({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      alignment: Alignment.center,
      child: Column(
        children: [
          const Icon(
            Icons.receipt_long_rounded,
            size: 64,
            color: Color(0xFF2A4A6B),
          ),
          const SizedBox(height: 12),
          Text(
            'Nenhum gasto registrado ainda',
            style: textTheme.bodyMedium?.copyWith(color: const Color(0xFF8EACC8)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ExpenseTile extends StatelessWidget {
  const _ExpenseTile({
    required this.description,
    required this.dateLabel,
    required this.valueLabel,
  });

  final String description;
  final String dateLabel;
  final String valueLabel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2C42),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF2A4A6B)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  dateLabel,
                  style: textTheme.labelSmall?.copyWith(
                    color: const Color(0xFF8EACC8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            valueLabel,
            style: textTheme.titleMedium?.copyWith(
              color: const Color(0xFF4FC3F7),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpenseItem {
  const _ExpenseItem({
    required this.description,
    required this.value,
    required this.createdAt,
  });

  final String description;
  final double value;
  final DateTime createdAt;

  static _ExpenseItem? tryFromJson(Map<String, dynamic> json) {
    final description = (json['description'] as String? ?? '').trim();
    final value = (json['value'] as num?)?.toDouble();
    final createdAtRaw = json['created_at'] as String?;
    final createdAt = DateTime.tryParse(createdAtRaw ?? '') ?? DateTime.now();

    if (description.isEmpty || value == null || value <= 0) {
      return null;
    }

    return _ExpenseItem(
      description: description,
      value: value,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'value': value,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

enum TaskPriority { low, med, high }

class TaskItem {
  TaskItem({
    required this.name,
    required this.description,
    required this.priority,
    required this.isDone,
  });

  final String name;
  final String description;
  final TaskPriority priority;
  bool isDone;
}

class DailyTasksScreen extends StatefulWidget {
  const DailyTasksScreen({super.key});

  @override
  State<DailyTasksScreen> createState() => _DailyTasksScreenState();
}

class _DailyTasksScreenState extends State<DailyTasksScreen> {
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  TaskPriority _selectedPriority = TaskPriority.med;

  final List<TaskItem> _tasks = [
    TaskItem(
      name: 'Finalizar design da interface',
      description:
          'Concluir os componentes Flutter e as regras de layout do projeto.',
      priority: TaskPriority.high,
      isDone: false,
    ),
    TaskItem(
      name: 'Fazer compras',
      description: 'Comprar leite, ovos, pão e frutas frescas para a semana.',
      priority: TaskPriority.med,
      isDone: false,
    ),
    TaskItem(
      name: 'Treino matinal',
      description: '',
      priority: TaskPriority.low,
      isDone: true,
    ),
  ];

  @override
  void dispose() {
    _taskNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _addTask() {
    final taskName = _taskNameController.text.trim();
    final description = _descriptionController.text.trim();

    if (taskName.isEmpty) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Informe o nome da tarefa.')),
        );
      return;
    }

    setState(() {
      _tasks.insert(
        0,
        TaskItem(
          name: taskName,
          description: description,
          priority: _selectedPriority,
          isDone: false,
        ),
      );
      _taskNameController.clear();
      _descriptionController.clear();
      _selectedPriority = TaskPriority.med;
    });
  }

  void _toggleTask(int index, bool? value) {
    setState(() {
      _tasks[index].isDone = value ?? false;
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  int get _pendingCount => _tasks.where((task) => !task.isDone).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 28),
          children: [
            Column(
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
                        size: 34,
                      ),
                    ),
                    Text(
                      'Tarefas Diárias',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 52 / 2,
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert_rounded,
                        color: AppColors.primaryText,
                        size: 34,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Organize seu dia e defina prioridades',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    color: AppColors.secondaryText,
                  ),
                ),
                const SizedBox(height: 36),
                _SectionLabel(text: 'Nome da Tarefa'),
                const SizedBox(height: 10),
                _InputField(
                  controller: _taskNameController,
                  hintText: 'O que precisa ser feito?',
                  prefixIcon: Icons.assignment_rounded,
                ),
                const SizedBox(height: 18),
                _SectionLabel(text: 'Descrição (Opcional)'),
                const SizedBox(height: 10),
                _InputField(
                  controller: _descriptionController,
                  hintText: 'Adicione mais detalhes...',
                  minLines: 4,
                  maxLines: 4,
                ),
                const SizedBox(height: 22),
                _SectionLabel(text: 'Nível de Prioridade'),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppColors.border, width: 1.3),
                  ),
                  child: RadioGroup<TaskPriority>(
                    groupValue: _selectedPriority,
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() => _selectedPriority = value);
                    },
                    child: Column(
                      children: const [
                        RadioListTile<TaskPriority>(
                          value: TaskPriority.low,
                          activeColor: AppColors.primary,
                          title: Text(
                            'Baixa',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        RadioListTile<TaskPriority>(
                          value: TaskPriority.med,
                          activeColor: AppColors.primary,
                          title: Text(
                            'Média',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        RadioListTile<TaskPriority>(
                          value: TaskPriority.high,
                          activeColor: AppColors.primary,
                          title: Text(
                            'Alta',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  height: 72,
                  child: FilledButton.icon(
                    onPressed: _addTask,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: const Color(0xFF0A3F84),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                    icon: const Icon(Icons.add_rounded, size: 34),
                    label: Text(
                      'Adicionar Nova Tarefa',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 42 / 2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 34),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Minhas Tarefas',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 42 / 2,
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: AppColors.border, width: 1.4),
                      ),
                      child: Text(
                        '$_pendingCount pendentes',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF0A3F84),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                if (_tasks.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.task_alt_rounded,
                          size: 56,
                          color: AppColors.hintText,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Tudo em dia!',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(color: AppColors.secondaryText),
                        ),
                      ],
                    ),
                  )
                else
                  for (var i = 0; i < _tasks.length; i++)
                    _TaskCard(
                      task: _tasks[i],
                      onChanged: (value) => _toggleTask(i, value),
                      onDelete: () => _removeTask(i),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: AppColors.primaryText,
        fontSize: 42 / 2,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.minLines,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final int? minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: AppColors.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppColors.secondaryText,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: prefixIcon == null
            ? null
            : Icon(prefixIcon, color: AppColors.secondaryText, size: 30),
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: const BorderSide(color: Color(0xFF141A2D), width: 1.3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: const BorderSide(color: Color(0xFF141A2D), width: 1.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: const BorderSide(color: AppColors.border, width: 1.4),
        ),
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  const _TaskCard({
    required this.task,
    required this.onChanged,
    required this.onDelete,
  });

  final TaskItem task;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final visual = _priorityVisual(task.priority);

    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.border, width: 1.3),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Checkbox(
              value: task.isDone,
              onChanged: onChanged,
              side: const BorderSide(
                color: AppColors.secondaryText,
                width: 1.8,
              ),
              checkColor: const Color(0xFF24153F),
              activeColor: const Color(0xFFD6C7FF),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primaryText,
                    fontSize: 42 / 2,
                    fontWeight: FontWeight.w700,
                    decoration: task.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: AppColors.secondaryText,
                  ),
                ),
                if (task.description.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    task.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.secondaryText,
                      fontSize: 14,
                      height: 1.3,
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: visual.background,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        visual.label,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: visual.foreground,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    if (task.isDone) ...[
                      const SizedBox(width: 12),
                      Text(
                        'Concluída',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.primaryText,
                          fontSize: 40 / 2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: Color(0xFFFFB4AB),
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

({String label, Color background, Color foreground}) _priorityVisual(
  TaskPriority priority,
) {
  switch (priority) {
    case TaskPriority.low:
      return (
        label: 'Baixa',
        background: const Color(0xFFE8F7EA),
        foreground: const Color(0xFF3D7D48),
      );
    case TaskPriority.med:
      return (
        label: 'Média',
        background: const Color(0xFFFFF8E1),
        foreground: const Color(0xFF8E7500),
      );
    case TaskPriority.high:
      return (
        label: 'Alta',
        background: const Color(0xFFFFEBEE),
        foreground: const Color(0xFFC83E3E),
      );
  }
}

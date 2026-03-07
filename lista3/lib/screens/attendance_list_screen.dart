import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class AttendanceListScreen extends StatefulWidget {
  const AttendanceListScreen({super.key});

  @override
  State<AttendanceListScreen> createState() => _AttendanceListScreenState();
}

class _AttendanceListScreenState extends State<AttendanceListScreen> {
  static const _dbName = 'attendance.db';
  static const _tableName = 'presenca';

  final _nameController = TextEditingController();
  final List<String> _participants = [];

  Database? _database;
  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _database?.close();
    super.dispose();
  }

  Future<void> _initDatabase() async {
    try {
      final dbPath = await _resolveDatabasePath();
      final factory = _resolveDatabaseFactory();

      _database = await factory.openDatabase(
        dbPath,
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: (db, version) async {
            await db.execute('''
              CREATE TABLE $_tableName (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                nome TEXT NOT NULL
              )
            ''');
          },
          onOpen: (db) async {
            await db.execute('''
              CREATE TABLE IF NOT EXISTS $_tableName (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                nome TEXT NOT NULL
              )
            ''');
          },
        ),
      );

      await _loadParticipants();
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _isLoading = false;
      });
      _showMessage('Erro ao iniciar banco de dados: $error', isError: true);
    }
  }

  Future<String> _resolveDatabasePath() async {
    final supportDir = await getApplicationSupportDirectory();
    final dbDir = Directory(p.join(supportDir.path, 'databases'));
    if (!await dbDir.exists()) {
      await dbDir.create(recursive: true);
    }
    return p.join(dbDir.path, _dbName);
  }

  DatabaseFactory _resolveDatabaseFactory() {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      return databaseFactoryFfi;
    }
    return databaseFactory;
  }

  Future<void> _loadParticipants() async {
    final db = _database;
    if (db == null) {
      return;
    }

    final rows = await db.query(_tableName, orderBy: 'id DESC');
    final loaded = rows
        .map((row) => (row['nome'] as String? ?? '').trim())
        .where((name) => name.isNotEmpty)
        .toList();

    if (!mounted) {
      return;
    }

    setState(() {
      _participants
        ..clear()
        ..addAll(loaded);
      _isLoading = false;
    });
  }

  Future<void> _addParticipant() async {
    FocusScope.of(context).unfocus();

    final db = _database;
    final name = _nameController.text.trim();

    if (name.isEmpty) {
      _showMessage('Informe um nome para adicionar.', isError: true);
      return;
    }

    if (db == null) {
      _showMessage('Banco indisponivel no momento.', isError: true);
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      await db.insert(_tableName, {'nome': name});
      _nameController.clear();
      await _loadParticipants();

      if (!mounted) {
        return;
      }

      _showMessage('Participante adicionado com sucesso!');
    } catch (_) {
      if (!mounted) {
        return;
      }
      _showMessage('Erro ao salvar participante.', isError: true);
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
      appBar: AppBar(
        title: const Text('Lista de Presenca'),
        actions: const [
          _TechBadge(),
          SizedBox(width: 12),
        ],
      ),
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Nome do participante',
                      style: textTheme.labelMedium?.copyWith(
                        color: const Color(0xFF8EACC8),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _nameController,
                            textInputAction: TextInputAction.done,
                            onSubmitted: (_) => _addParticipant(),
                            decoration: const InputDecoration(
                              hintText: 'Ex: Maria Souza',
                              contentPadding: EdgeInsets.all(16),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 52,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: _isSaving ? null : _addParticipant,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: _isSaving
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  )
                                : const Icon(Icons.add_rounded),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Presencas', style: textTheme.titleMedium),
                        Text(
                          '(${_participants.length})',
                          style: textTheme.titleMedium?.copyWith(
                            color: const Color(0xFF4FC3F7),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (_participants.isEmpty)
                      Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A2C42),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFF2A4A6B)),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.assignment_ind_outlined,
                              size: 64,
                              color: Color(0xFF2A4A6B),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Nenhuma presenca registrada',
                              style: textTheme.bodyMedium?.copyWith(
                                color: const Color(0xFF8EACC8),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    else
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A2C42),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFF2A4A6B)),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _participants.length,
                          separatorBuilder: (_, index) => const Divider(height: 1),
                          itemBuilder: (context, index) {
                            final participant = _participants[index];
                            return ListTile(
                              leading: Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF4FC3F7),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              title: Text(
                                '${index + 1}. $participant',
                                style: textTheme.bodyMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _TechBadge extends StatelessWidget {
  const _TechBadge();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0x1A4FC3F7),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0x334FC3F7)),
      ),
      child: Text(
        'SQLite',
        style: textTheme.labelSmall?.copyWith(
          color: const Color(0xFF4FC3F7),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

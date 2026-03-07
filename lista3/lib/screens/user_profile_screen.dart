import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  static const _profileFileName = 'user_profile.json';
  static final _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<File> _getProfileFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}${Platform.pathSeparator}$_profileFileName');
  }

  Future<void> _loadProfile() async {
    try {
      final file = await _getProfileFile();
      if (!await file.exists()) {
        return;
      }

      final content = await file.readAsString();
      if (content.trim().isEmpty) {
        return;
      }

      final data = jsonDecode(content);
      if (data is! Map<String, dynamic>) {
        return;
      }

      _nameController.text = (data['name'] as String? ?? '').trim();
      _emailController.text = (data['email'] as String? ?? '').trim();
    } catch (_) {
      if (!mounted) {
        return;
      }
      _showMessage('Erro ao carregar perfil salvo.', isError: true);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _saveProfile() async {
    FocusScope.of(context).unfocus();

    final isFormValid = _formKey.currentState?.validate() ?? false;
    if (!isFormValid) {
      _showMessage('Preencha os campos corretamente.', isError: true);
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final file = await _getProfileFile();
      final payload = {
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
      };

      await file.writeAsString(jsonEncode(payload));

      if (!mounted) {
        return;
      }

      _showMessage('Perfil salvo com sucesso.');
    } catch (_) {
      if (!mounted) {
        return;
      }
      _showMessage('Erro ao salvar perfil.', isError: true);
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
      appBar: AppBar(title: const Text('Perfil de Usuario')),
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width: 72,
                            height: 72,
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: const Color(0x1A4FC3F7),
                              borderRadius: BorderRadius.circular(999),
                              border: Border.all(color: const Color(0xFF2A4A6B)),
                            ),
                            child: const Icon(
                              Icons.person_rounded,
                              size: 38,
                              color: Color(0xFF4FC3F7),
                            ),
                          ),
                          Text('Dados de Perfil', style: textTheme.titleLarge),
                          const SizedBox(height: 8),
                          Text(
                            'Salve nome e e-mail localmente em JSON.',
                            style: textTheme.bodySmall,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _nameController,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              labelText: 'Nome',
                              hintText: 'Digite seu nome',
                              prefixIcon: Icon(Icons.badge_outlined),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Nome obrigatorio.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                              labelText: 'E-mail',
                              hintText: 'usuario@dominio.com',
                              prefixIcon: Icon(Icons.alternate_email_rounded),
                            ),
                            onFieldSubmitted: (_) {
                              _saveProfile();
                            },
                            validator: (value) {
                              final email = value?.trim() ?? '';
                              if (email.isEmpty) {
                                return 'E-mail obrigatorio.';
                              }
                              if (!_emailRegex.hasMatch(email)) {
                                return 'Informe um e-mail valido.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: _isSaving ? null : _saveProfile,
                            icon: _isSaving
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  )
                                : const Icon(Icons.save_outlined),
                            label: Text(_isSaving ? 'Salvando...' : 'Salvar'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

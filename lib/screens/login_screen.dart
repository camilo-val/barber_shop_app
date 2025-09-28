import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _loading = false;
  String? _error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ingresar')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator:
                        (v) => (v == null || v.isEmpty) ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Contraseña'),
                    validator:
                        (v) => (v == null || v.isEmpty) ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 16),
                  if (_error != null)
                    Text(_error!, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed:
                        _loading
                            ? null
                            : () async {
                              if (!_formKey.currentState!.validate()) return;
                              setState(() {
                                _loading = true;
                                _error = null;
                              });
                              final err = await context
                                  .read<AuthProvider>()
                                  .login(_email.text, _password.text);
                              if (!mounted) return;
                              if (err != null) {
                                setState(() {
                                  _error = err;
                                  _loading = false;
                                });
                              }
                            },
                    child:
                        _loading
                            ? const SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                            : const Text('Entrar'),
                  ),
                  TextButton(
                    onPressed:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RegisterScreen(),
                          ),
                        ),
                    child: const Text('Crear cuenta'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

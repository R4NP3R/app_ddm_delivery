import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _entrar() {
  }

  void _esqueciSenha() {}

  void _entrarComGoogle() {}

  void _criarConta() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F0F0),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color(0xFFD0D0D0),
                            style: BorderStyle.values[1],
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Marca',
                          style: TextStyle(fontSize: 9, color: Colors.black54),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    const Center(
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF292929),
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Center(
                      child: Text(
                        'Acesse sua conta para continuar.',
                        style: TextStyle(fontSize: 8, color: Colors.grey),
                      ),
                    ),

                    const SizedBox(height: 22),

                    const Text(
                      'E-mail',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 5),

                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      decoration: _inputDecoration(hint: 'Digite seu e-mail'),
                      style: const TextStyle(fontSize: 11),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Digite seu e-mail';
                        }

                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Digite um e-mail válido';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Senha',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 5),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: _inputDecoration(hint: 'Digite sua senha')
                          .copyWith(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ),
                            suffixIconConstraints: const BoxConstraints(
                              minWidth: 35,
                              minHeight: 35,
                            ),
                          ),
                      style: const TextStyle(fontSize: 11),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Digite sua senha';
                        }

                        if (value.length < 6) {
                          return 'A senha deve ter pelo menos 6 caracteres';
                        }

                        return null;
                      },
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: _esqueciSenha,
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          foregroundColor: const Color(0xFF333333),
                        ),
                        child: const Text(
                          'Esqueci minha senha',
                          style: TextStyle(fontSize: 7),
                        ),
                      ),
                    ),

                    const SizedBox(height: 7),

                    SizedBox(
                      width: double.infinity,
                      height: 38,
                      child: ElevatedButton(
                        onPressed: _entrar,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF303030),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 17),

                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color(0xFFDADADA),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'ou',
                            style: TextStyle(fontSize: 8, color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xFFDADADA),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 17),

                    SizedBox(
                      width: double.infinity,
                      height: 34,
                      child: OutlinedButton(
                        onPressed: _entrarComGoogle,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF333333),
                          side: const BorderSide(color: Color(0xFFC8C8C8)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'G',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Continuar com Google',
                              style: TextStyle(fontSize: 9),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Text(
                            'Não tem uma conta? ',
                            style: TextStyle(fontSize: 8, color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: _criarConta,
                            child: const Text(
                              'Criar conta',
                              style: TextStyle(
                                fontSize: 8,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w600,
                              ),
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
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({required String hint}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 8, color: Color(0xFFAAAAAA)),
      filled: true,
      fillColor: const Color(0xFFFCFCFC),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: Color(0xFFD5D5D5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: Color(0xFFD5D5D5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: Color(0xFF555555)),
      ),
      errorStyle: const TextStyle(fontSize: 9),
    );
  }
}

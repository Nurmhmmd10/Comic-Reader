import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../utils/session_manager.dart';
import 'register_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final _userCtl = TextEditingController();
  final _passCtl = TextEditingController();
  bool _loading = false;

  void _login() async {
    setState(() => _loading = true);
    final res = await AuthService.login(_userCtl.text.trim(), _passCtl.text.trim());
    setState(() => _loading = false);
    if (res['status'] == 'success') {
      final user = res['user'];
      await SessionManager.setLogin(id: int.parse(user['id'].toString()), name: user['username'].toString());
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage(onToggleTheme: (v){}, isDark: SessionManager.isDarkMode ?? false)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res['message'] ?? 'Login failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _userCtl, decoration: const InputDecoration(labelText: 'Username')),
            TextField(controller: _passCtl, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loading ? null : _login,
              child: _loading ? const CircularProgressIndicator(color: Colors.white) : const Text('Login')
            ),
            TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterPage())), child: const Text('Create account'))
          ],
        ),
      ),
    );
  }
}

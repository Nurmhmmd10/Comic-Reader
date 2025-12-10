import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _userCtl = TextEditingController();
  final _passCtl = TextEditingController();
  bool _loading = false;

  void _register() async {
    setState(() => _loading = true);
    final res = await AuthService.register(_userCtl.text.trim(), _passCtl.text.trim());
    setState(() => _loading = false);
    if (res['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registered. Please login.')));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res['message'] ?? 'Register failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register')
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _userCtl, decoration: const InputDecoration(labelText: 'Username')),
            TextField(controller: _passCtl, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loading ? null : _register, 
              child: _loading ? const CircularProgressIndicator(color: Colors.white) : const Text('Register')
              )
          ],
        ), 
      ),
    );
  }
}
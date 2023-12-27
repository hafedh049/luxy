import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: dark,
          leading: IconButton(
            icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text("Create new password", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Expanded(
                child: SizedBox(),
              ),
              const Text("Create your new password", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.2)),
                child: StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: const TextStyle(color: grey),
                        prefixIcon: const Icon(Bootstrap.lock_fill, size: 15, color: grey),
                        suffixIcon: IconButton(
                          onPressed: () => _(() => _obscurePassword = !_obscurePassword),
                          icon: Icon(_obscurePassword ? Bootstrap.eye_slash : Bootstrap.eye, size: 15, color: grey),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.2)),
                child: StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return TextField(
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: const TextStyle(color: grey),
                        prefixIcon: const Icon(Bootstrap.lock_fill, size: 15, color: grey),
                        suffixIcon: IconButton(
                          onPressed: () => _(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                          icon: Icon(_obscureConfirmPassword ? Bootstrap.eye_slash : Bootstrap.eye, size: 15, color: grey),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 140),
                child: Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
            ],
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ResetPasswordForm()
            ),
          ),
        ],
      ),
    );
  }
}

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  bool _isLoading = false;
  bool _redirecting = false;
  late final TextEditingController _passwordController = TextEditingController();
  late final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passwordVisibility = false;
  bool confirmPasswordVisibility = false;

  Future<void> _reset() async {
    try {
      setState(() {
        _isLoading = true;
      });

      Navigator.of(context).pushReplacementNamed('/home');

    } catch (error) {
      SnackBar(
        content: const Text('Unexpected error occured'),
        backgroundColor: Theme.of(context).colorScheme.error,
        );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Center(
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              const SizedBox(height: 18),
              TextFormField(
                obscureText: passwordVisibility,
                controller: _passwordController,
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    'assets/images/security.svg',
                    width: 25,
                    height: 25,
                    semanticsLabel: 'security'),
                  labelText: 'Password',
                  border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisibility = !passwordVisibility;
                      });
                    },
                    icon: passwordVisibility ? SvgPicture.asset(
                    'assets/images/eye.svg',
                    width: 25,
                    height: 25,
                    semanticsLabel: 'eye')
                    : SvgPicture.asset(
                    'assets/images/eye-slash.svg',
                    width: 25,
                    height: 25,
                    semanticsLabel: 'eye-slash')
                  ),
                ),
              ),
              const SizedBox(height: 18),
              TextFormField(
                obscureText: confirmPasswordVisibility,
                controller: _passwordController,
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    'assets/images/security.svg',
                    width: 25,
                    height: 25,
                    semanticsLabel: 'security'),
                  labelText: 'Confirm Password',
                  border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        confirmPasswordVisibility = !confirmPasswordVisibility;
                      });
                    },
                    icon: confirmPasswordVisibility ? SvgPicture.asset(
                    'assets/images/eye.svg',
                    width: 25,
                    height: 25,
                    semanticsLabel: 'eye')
                    : SvgPicture.asset(
                    'assets/images/eye-slash.svg',
                    width: 25,
                    height: 25,
                    semanticsLabel: 'eye-slash')
                  ),
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: _isLoading ? null : _reset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 4, 141, 151)
                ),
                child: Text(
                  style: const TextStyle(color: Colors.white),
                  _isLoading ? 'Loading' : 'reset ->'
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
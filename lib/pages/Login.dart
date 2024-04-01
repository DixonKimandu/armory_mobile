import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
              child: LoginForm()
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isLoading = false;
  bool _redirecting = false;
  late final TextEditingController _serviceNumberController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool visibility = false;

  Future<void> _signIn() async {
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
    _serviceNumberController.dispose();
    _passwordController.dispose();
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
              TextFormField(
                controller: _serviceNumberController,
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    'assets/images/user-octagon.svg',
                    width: 25,
                    height: 25,
                    semanticsLabel: 'user'),
                  labelText: 'Service Number', 
                  border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)))
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              TextFormField(
                obscureText: visibility,
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
                        visibility = !visibility;
                      });
                    },
                    icon: visibility ? SvgPicture.asset(
                    'assets/images/eye-slash.svg',
                    width: 25,
                    height: 25,
                    semanticsLabel: 'eye-slash')
                    : SvgPicture.asset(
                    'assets/images/eye.svg',
                    width: 25,
                    height: 25,
                    semanticsLabel: 'eye-slash')
                  ),
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: _isLoading ? null : _signIn,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 4, 141, 151)
                ),
                child: Text(
                  style: const TextStyle(color: Colors.white),
                  _isLoading ? 'Loading' : 'login ->'
                ),
              ),
              const SizedBox(height: 18),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/forgot-password');
                  },
                  child: const Text(
                    'Forgot Password?'
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
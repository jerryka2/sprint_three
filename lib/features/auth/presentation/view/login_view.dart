import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:third_sp/features/auth/presentation/view/signup_view.dart';
import 'package:third_sp/features/auth/presentation/view_model/login/bloc/login_bloc.dart';
import 'package:third_sp/features/auth/presentation/view_model/login/bloc/login_event.dart';
import 'package:third_sp/features/auth/presentation/view_model/login/bloc/login_state.dart'; // Assuming you have a LoginState defined

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Logo or image
              Image.asset(
                'assets/images/image_2.png',
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 40),
              // App title
              const Text(
                'ENERGIZE NEPAL',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3454A4),
                ),
              ),
              const SizedBox(height: 20),
              // Welcome text
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Use your credentials to access your account',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.lightBlue,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Username text field
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.person, color: Colors.greenAccent),
                  hintText: 'Enter Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff07DEA3),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Password text field
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Colors.greenAccent),
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff07DEA3),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Implement forgot password functionality
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Login button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final username = usernameController.text.trim();
                    final password = passwordController.text.trim();

                    // Dispatch the LoginSubmitted event
                    context.read<LoginBloc>().add(LoginSubmitted(
                          username: username,
                          password: password,
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Sign up link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // BlocListener to handle login success/error states
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    // Navigate to another screen or show success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login successful!')),
                    );
                  } else if (state is LoginFailure) {
                    // Show error message if login fails
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${state.error}')),
                    );
                  }
                },
                child:
                    Container(), // Add an empty container or any widget if necessary
              ),
            ],
          ),
        ),
      ),
    );
  }
}

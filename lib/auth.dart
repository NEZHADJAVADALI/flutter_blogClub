import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/profile.dart';
import 'package:flutter/material.dart';

// Ensure article.dart exists and is correctly implemented
// import 'package:blogclub/article.dart';

class LoginSignUp extends StatefulWidget {
  const LoginSignUp({super.key});

  @override
  State<LoginSignUp> createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  Auth loginOrSignUp = Auth.login;
  void _updateAuth(Auth auth) {
    setState(() {
      loginOrSignUp = auth;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final themedata = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF4F7FF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _Logo(),
          Container(
            height: 639,
            decoration: BoxDecoration(
              color: themedata.colorScheme.primary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                LoginSignUpButtons(
                  themedata: themedata,
                  loginOrSignUp: loginOrSignUp,
                  onAuthChanged: _updateAuth,
                ),
                loginOrSignUp == Auth.login
                    ? _LoginSection(
                      screenWidth: screenWidth,
                      themedata: themedata,
                    )
                    : _SignUpSection(
                      screenWidth: screenWidth,
                      themedata: themedata,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 18),
        child: Assets.img.icons.logo.image(height: 56, width: 110),
      ),
    );
  }
}

class _LoginSection extends StatelessWidget {
  const _LoginSection({required this.screenWidth, required this.themedata});

  final double screenWidth;
  final ThemeData themedata;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: themedata.colorScheme.surface,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            topLeft: Radius.circular(32),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Welcome Back",
                      style: themedata.textTheme.headlineMedium,
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      "Sign in with your account",
                      style: themedata.textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextField(decoration: InputDecoration(label: Text("Username"))),
                const SizedBox(height: 16),
                _PasswordTextField(),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return Profile();
                        },
                      ),
                    );
                  },
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(Size(295, 60)),
                    backgroundColor: WidgetStateProperty.all(
                      themedata.colorScheme.primary,
                    ),
                    foregroundColor: WidgetStateProperty.all(
                      themedata.colorScheme.onPrimary,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  child: Text("LOGIN"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Forgot your password?"),
                    TextButton(onPressed: () {}, child: Text("Reset here")),
                  ],
                ),
                const SizedBox(height: 30),
                Text("OR SIGN IN WITH", style: TextStyle(letterSpacing: 2)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.img.icons.google.image(width: 36, height: 36),
                    SizedBox(width: 27),
                    Assets.img.icons.facebook.image(width: 36, height: 36),
                    SizedBox(width: 27),
                    Assets.img.icons.twitter.image(width: 36, height: 36),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SignUpSection extends StatelessWidget {
  const _SignUpSection({required this.screenWidth, required this.themedata});

  final double screenWidth;
  final ThemeData themedata;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: themedata.colorScheme.surface,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            topLeft: Radius.circular(32),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Welcome Back",
                      style: themedata.textTheme.headlineMedium,
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      "Sign up with your account",
                      style: themedata.textTheme.bodyMedium,
                    ),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(label: Text("Full name")),
                ),
                SizedBox(height: 16),
                TextField(decoration: InputDecoration(label: Text("Username"))),
                const SizedBox(height: 16),
                _PasswordTextField(),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(Size(295, 60)),
                    backgroundColor: WidgetStateProperty.all(
                      themedata.colorScheme.primary,
                    ),
                    foregroundColor: WidgetStateProperty.all(
                      themedata.colorScheme.onPrimary,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  child: Text("SIGN UP"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Forgot your password?"),
                    TextButton(onPressed: () {}, child: Text("Reset here")),
                  ],
                ),
                const SizedBox(height: 30),
                Text("OR SIGN IN WITH", style: TextStyle(letterSpacing: 2)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.img.icons.google.image(width: 36, height: 36),
                    SizedBox(width: 27),
                    Assets.img.icons.facebook.image(width: 36, height: 36),
                    SizedBox(width: 27),
                    Assets.img.icons.twitter.image(width: 36, height: 36),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField();

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        label: Text("Password"),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(top: 14),
          child: TextButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: _obscureText ? Text("Show") : Text("Hide"),
          ),
        ),
      ),
    );
  }
}

class LoginSignUpButtons extends StatefulWidget {
  const LoginSignUpButtons({
    super.key,
    required this.themedata,
    required this.loginOrSignUp,
    required this.onAuthChanged,
  });
  final Auth loginOrSignUp;
  final ThemeData themedata;
  final ValueChanged<Auth> onAuthChanged;
  @override
  State<LoginSignUpButtons> createState() => LoginSignUpButtonsState();
}

class LoginSignUpButtonsState extends State<LoginSignUpButtons> {
  void _toggleAuth(Auth auth) {
    widget.onAuthChanged(auth);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              setState(() => _toggleAuth(Auth.login));
            },
            child: Text(
              "LOGIN",
              style: widget.themedata.textTheme.labelMedium!.apply(
                fontSizeFactor: 0.9,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() => _toggleAuth(Auth.signUp));
            },
            child: Text(
              "SIGNUP",
              style: widget.themedata.textTheme.labelMedium!.apply(
                fontSizeFactor: 0.9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum Auth { login, signUp }

import 'package:flutter/material.dart';
import 'SignUpPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  final String title = 'ورود';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        title: Text(widget.title, style: Theme.of(context).textTheme.headline2),
      ),
      body: InkResponse(
        containedInkWell: false,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 100.0),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                child: Text(
                    'آدرس ایمیل و رمز عبور خود را وارد کنید.',
                    style: Theme.of(context).textTheme.headline1,
                )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: TextField(
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: 'ایمیل',
                  // hintText: 'ایمیل',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIcon: const Icon(Icons.email),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: TextField(
                obscureText: visiblePassword,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: 'رمز عبور',
                  // hintText: 'رمز عبور',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(visiblePassword
                        ? Icons.visibility
                        : Icons.visibility_off
                    ),
                    onPressed: () {
                      setState(() {
                        visiblePassword = !visiblePassword;
                      });
                    },
                  ),
                ),
              ),
            ),
            // submit button
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () => _showSnackBar(context, 'ورود با موفقیت انجام شد.'),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(150.0, 50.0)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000.0),
                      ),
                    ),
                  ),
                  child: Text(
                      'ورود',
                      style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0,),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'فراموشی رمز عبور',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text, style: Theme.of(context).textTheme.headline2),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 1),
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:flatterfire/authintication_services/authintication_anonymously.dart';
import 'package:provider/provider.dart';

class SiginIn extends StatefulWidget {
  const SiginIn({Key? key}) : super(key: key);

  @override
  State<SiginIn> createState() => _SiginInState();
}

class _SiginInState extends State<SiginIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange.shade600,
          title: const Text('تسجيل الدخول'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('تسجيل الدخول بهوية مجهولة'),
                  onPressed: () {
                    context
                        .read<AuthinticationAninymously>()
                        .signInAnonymously((Exception error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error.toString()),
                          backgroundColor: Colors.red.shade900,
                        ),
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

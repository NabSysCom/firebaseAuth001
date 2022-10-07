import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flatterfire/authintication_services/authintication_status.dart';
import 'package:provider/provider.dart';

class MembersHome extends StatefulWidget {
  const MembersHome({Key? key}) : super(key: key);

  @override
  State<MembersHome> createState() => _MembersHomeState();
}

class _MembersHomeState extends State<MembersHome> {
  User? myUser;
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AuthinticationStatus>();
    myUser = appState.userProfile;

    return SafeArea(
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange.shade600,
          title: const Text('مساحة الأعضاء'),
          actions: [
            IconButton(
              onPressed: () {
                context.read<AuthinticationStatus>().signOut();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: const Icon(Icons.numbers, color: Colors.green),
                tileColor: Colors.green[50],
                title: const Text('رقم العضوية'),
                subtitle: Text(myUser!.uid.toString()),
              ),
              const Divider(),
              ListTile(
                leading:
                    const Icon(Icons.app_registration, color: Colors.green),
                tileColor: Colors.green[50],
                title: const Text('نوع التسجيل'),
                subtitle: Text((myUser!.isAnonymous == true)
                    ? 'تسجيل بهوية مجهولة'
                    : 'غير ذلك'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.abc, color: Colors.green),
                tileColor: Colors.green[50],
                title: const Text('الاسم'),
                subtitle: Text(myUser!.displayName.toString()),
              ),
              const Divider(),
              ListTile(
                leading:
                    const Icon(Icons.lock_clock_outlined, color: Colors.green),
                tileColor: Colors.green[50],
                title: const Text('تاريخ إنشاء الحساب'),
                subtitle: Text(myUser!.metadata.creationTime.toString()),
              ),
              const Divider(),
              ListTile(
                leading:
                    const Icon(Icons.lock_clock_outlined, color: Colors.green),
                tileColor: Colors.green[50],
                title: const Text('تاريخ أخز تسجيل دخول'),
                subtitle: Text(myUser!.metadata.lastSignInTime.toString()),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    ));
  }
}

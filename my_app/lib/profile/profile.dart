import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:my_app/services/services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Authentication().user;

    // var report = Provider.of<Report>(context);

    if (user != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                user.email ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 180,
              ),
              // Text('${report.total}',
              //     style: Theme.of(context).textTheme.headline2),
              // Text('Quizzes Completed',
              //     style: Theme.of(context).textTheme.subtitle2),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(24),
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () async {
                    await Authentication().signOut();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false);
                  },
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
        title: const Text('No Current User'),
      ));
    }
  }
}

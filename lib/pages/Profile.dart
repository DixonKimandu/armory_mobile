import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 141, 151),
      ),
      body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            Center(
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.height * .1,
                child: SvgPicture.asset(
                      'assets/images/avatar.svg',
                      width: 100,
                      height: 100,
                      semanticsLabel: 'avatar'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            const ListTile(
              leading:  Icon(Icons.email_outlined),
              title: Text(
                'johndoe@gmail.com',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(Icons.arrow_right_alt),
            ),
            const ListTile(
              leading:  Icon(Icons.home_outlined),
              title: Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(Icons.arrow_right_alt),
            ),
            const ListTile(
              leading:  Icon(Icons.numbers_outlined),
              title: Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(Icons.arrow_right_alt),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            const Center(
              child: Text(
                'App Version 1.0.0',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Colors.grey
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 4, 141, 151)
              ),
              child: const Text(
                style: TextStyle(color: Colors.white),
                'Edit Profile'
              ),
            ),
          ],
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tezos_asessment/app/presentation/pages/explore.dart';
import 'package:tezos_asessment/app/presentation/widgets/custom_field.dart';
import 'package:tezos_asessment/core/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ExplorePage()));
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          decoration: BoxDecoration(
            color: salemGreen,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.only(bottom: 40, left: 16,right: 16),
          padding: const EdgeInsets.symmetric(vertical: 14),
          child:  const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Continue',style: TextStyle(color: Colors.white,fontSize: 16),),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const Text(
            'Log in to your account',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Welcome back! Please enter your registered email address to continue.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.black.withOpacity(0.6)),
          ),
          const SizedBox(
            height: 24,
          ),
          const CustomField(
            title: 'Email Address',
            hintText: 'hello@busha.co',
          ),
          const SizedBox(
            height: 16,
          ),
           const CustomField(
            title: 'Password',
            hintText: 'Enter password',
            suffixIcon: Text(
              'HIDE',
              style: TextStyle(color: scorpionGrey,fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

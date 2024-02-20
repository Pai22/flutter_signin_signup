import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'Meeting Online', //titleต้องเขียนข้อความ
      body:
          'Stay home and complete all of your importance work and meeting for keeping safe you and your family member.', //bodyต้องเขียนข้อความ
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
          ),
          onPressed: () {},
          child: const Text('Lest s go'),
        ), //ปุ่มกด
      ),
      image: Image.asset('assets/images/slider1.png'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'Wear a Mask', //titleต้องเขียนข้อความ
      body:
          'When you go outside of your home then obiously you have to wear a mask for keeping safe from covid-19', //bodyต้องเขียนข้อความ
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('Lest s go'),
        ), //ปุ่มกด
      ),
      image: Image.asset('assets/images/slider2.png'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'Social Distance', //titleต้องเขียนข้อความ
      body:
          'By maintaining social distance you can kep safe from other covid virus affected people and keep safe from covid-19', //bodyต้องเขียนข้อความ
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('Lest s go'),
        ), //ปุ่มกด
      ),
      image: Image.asset("assets/images/slider3.png"),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COVID-19'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: pages,
        showSkipButton: true, //โชว์ปุ่มskip ไปหน้าสุดท้าย
        skip: const Text('Skip'), //โชว์ข้อความปุ่มskip
        showDoneButton: true, //เมื่อถึงหน้าสุดท้าย โชว์ปุ่มDone
        done: const Text('Done'), //โชว์ข้อความปุ่มdone
        showNextButton: true,
        next: const Icon(
          Icons.arrow_forward,
          size: 25,
        ), //กำหนดตัวไอคอน
        onDone: () => onDone(
            context), //เป็นฟังก์ชั่นเมื่อกดปุ่มแล้วให้ย้อนกลับไปหน้าHome 'onDone is Name function'
        curve: Curves.bounceOut,
        dotsDecorator: const DotsDecorator(
          size: Size(15, 15),
          color: Colors.blue,
          activeColor: Colors.orange,
          activeSize: Size.square(20),
        ),
      ),
    );
  }

  //function onDone
  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
  }
}

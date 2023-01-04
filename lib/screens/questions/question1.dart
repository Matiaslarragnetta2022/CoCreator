import 'package:cocreator_app/screens/questions/widgets/answer_button.dart';
import 'package:flutter/material.dart';

import 'widgets/button_gradient.dart';

class Question1Screen extends StatelessWidget {
  static const String routeName = '/question1';
  const Question1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 330,
              width: 350,
              child: Image.asset(
                'assets/question1.gif',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            AnswerButton(
              text: 'Work',
              onPressed: (() {
                Navigator.pushNamed(
                  context,
                  '/question2',
                );
              }),
            ),
            const SizedBox(
              height: 5,
            ),
            AnswerButton(
              text: 'Personal use',
              onPressed: (() {
                Navigator.pushNamed(
                  context,
                  '/question2',
                );
              }),
            ),
            const SizedBox(
              height: 5,
            ),
            AnswerButton(
              text: 'School',
              onPressed: (() {
                Navigator.pushNamed(
                  context,
                  '/question2',
                );
              }),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 250,
              height: 45,
              child: Form(
                  child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Other',
                    hintStyle: TextStyle(color: Colors.black)),
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            indicatorQuestion(),
            const SizedBox(
              height: 40,
            ),
            ButtonGradient(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.2,
                      0.5,
                      10
                    ],
                    colors: [
                      (Color(0xffFD0745)),
                      Color.fromARGB(255, 221, 34, 137),
                      Color(0xff6D49C2)
                    ]),
                borderRadius: BorderRadius.circular(15),
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/question2',
                );
              },
              text: 'Next',
            )
          ],
        )),
      ),
    );
  }

  Row indicatorQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 242, 173, 168),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 242, 173, 168),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ],
    );
  }
}


// Color(0xffFD0745),
//                     Color(0xff6D49C2),
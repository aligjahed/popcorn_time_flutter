import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'db/database.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  try {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db')
        .build();

    runApp(const MyApp());
  }catch (on , stacktrace){
    throw new Exception(stacktrace);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Estedad'
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      next: const Text('next' , style: TextStyle(color: Colors.black)),
      skip: Text('Skip'),
      back: Text('back'),
      showBottomPart: true,
      isProgressTap: false,
      showBackButton: true,

      pages: [
        PageViewModel(
          title: "Title of orange text and bold page",
          body: "This is a description on a page with an orange title and bold, big body.",
          image: const Center(
            child: Text("👋", style: TextStyle(fontSize: 100.0)),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(color: Colors.orange),
            bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
          ),
        ),
        PageViewModel(
          title: "Title of custom button page",
          body: "This is a description on a page with a custom button below.",
          image: Image.asset("res/images/logo.png", height: 175.0),
          footer: ElevatedButton(
            onPressed: () {
              // On button pressed
            },
            child: const Text("Let's Go!"),
          ),
        ),
        PageViewModel(
          title: "Title of custom body page",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click on "),
              Icon(Icons.edit),
              Text(" to edit a post"),
            ],
          ),
          image: const Center(child: Icon(Icons.android)),
        )
      ],
      showNextButton: false,
      done: const Text("Done"),
      onDone: () {
        // On button pressed
      },
    );
  }
}

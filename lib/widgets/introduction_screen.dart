import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:introduction_screen/introduction_screen.dart';

class CostumeIntroductionScreen extends StatelessWidget {
  const CostumeIntroductionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double windowWidth = MediaQuery.of(context).size.width;
    final double windowHeight = MediaQuery.of(context).size.height;
    precacheImage(AssetImage('lib/assets/images/intro_welcome_background.jpg'), context);
    precacheImage(AssetImage('lib/assets/images/background_texture.jpg'), context);

    final List<PageViewModel> introductionPages = [
      PageViewModel(
        decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodyTextStyle: TextStyle(
              color: Colors.white,
            ),
            imagePadding: EdgeInsets.all(0)),
        title: tr('introduction.welcome.title'),
        body: tr('introduction.welcome.body'),
        image: const Center(
          child: Text("👋", style: TextStyle(fontSize: 150.0)),
        ),
      )
    ];

    return Stack(
      children: [
        Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'lib/assets/images/intro_welcome_background.jpg',
                  fit: BoxFit.cover,
                ),
                Opacity(
                  opacity: 0.85,
                  child: Container(
                    width: windowWidth,
                    height: windowHeight,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ).animate().fadeIn(duration: 500.ms),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3.0,
                sigmaY: 3.0,
              ),
              child: Container(
                color: Colors.transparent,
              ),
            )
          ],
        ),
        Container(
          width: windowWidth,
          height: windowHeight,
          child: Opacity(
            child: Image.asset(
              'lib/assets/images/background_texture.png',
              fit: BoxFit.cover,
            ),
            opacity: 0.1,
          ),
        ),
        IntroductionScreen(
          pages: introductionPages,
          next: const Text('general.nextBtn').tr(),
          done: const Text('general.doneBtn').tr(),
          onDone: () {},
          showNextButton: true,
          showDoneButton: true,
          showBackButton: false,
          isProgressTap: false,
          globalBackgroundColor: Colors.transparent,
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.white,
            color: Colors.grey,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ).animate().fadeIn(duration: 1000.ms).slide(duration: 750.ms),
      ],
    );
  }
}

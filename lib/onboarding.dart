import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:onboarding_screen/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}
class _OnboardingState extends State<Onboarding> {
  var pageController = PageController(initialPage: 0);
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              onPageChanged: (value) {
                if (value == 2) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              children: [
                buildPageOne(height),
                buildPageTwo(height),
                buildPageThree(height),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.deepOrange,
                    activeDotColor: Colors.deepPurple,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextButton(
                  onPressed: () {
                    if (!isLast) {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.bounceInOut);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    }
                  },
                  style: const ButtonStyle(
                      overlayColor: MaterialStatePropertyAll(Colors.white)),
                  child: isLast
                      ? Row(
                          children: [
                            const Text('Let\'s Go ' ,style: TextStyle(color: Colors.deepPurple ,fontSize: 16)),
                            Image.asset('assets/image/ss.jpg',
                                height: 30, width: 35 ,fit: BoxFit.fill,
                            ),
                          ],
                        )
                      : const Text('NEXT' ,style: TextStyle(fontSize: 16 ,color: Colors.deepPurple)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column buildPageOne(double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height * 0.70,
          width: double.infinity,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/pic1.png'), fit: BoxFit.fill),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'SURPRISE DESTINATION EXP',
          style: GoogleFonts.montserratAlternates(
            color: HexColor('ffa630'),
            fontSize: 22,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Travel like you never imagined before',
          style: GoogleFonts.montserratAlternates(
            color: HexColor('00a7e1'),
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Column buildPageTwo(double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.70,
          width: double.infinity,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/pic2.png'), fit: BoxFit.fill),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(
            'LET THE DESTINATION\nSURPRISE YOU! ',
            style: GoogleFonts.montserratAlternates(
              color: HexColor('00a7e1'),
              fontSize: 26,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            '1 CHOOSE AN EXPERIENCE\n2 CUSTOMISE YOUR RESERVATION\n3 PACK YOUR BAGS AND... SURPRISE  ',
            style: GoogleFonts.montserratAlternates(
              color: HexColor('ffa630'),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Column buildPageThree(double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height * 0.70,
          width: double.infinity,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/pic3.png'), fit: BoxFit.fill),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'LIVE IS A JOURNEY,\n\t\t\t\t\t\t\tNOT A DESTINATION',
          style: GoogleFonts.montserratAlternates(
            color: Colors.deepOrange,
            fontSize: 26,
          ),
        ),
      ],
    );
  }
}

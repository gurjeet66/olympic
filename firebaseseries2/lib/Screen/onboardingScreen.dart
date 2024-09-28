import 'package:firebaseseries2/Screen/Auth/login_Page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  List<Widget> _buildOnboardingPages() {
    return [
      buildOnboardingPage('assets/Ellipse 71.png',"Discover Olympic History", "    Explore detailed records,medal counts, and\n historical moments from every Olympic Games.",),
      buildOnboardingPage('assets/Ellipse 71 (1).png',"Track Medal Progress","   Follow the journey of your favoritecountries and\n  athletes, year by year, and see theirachievements \n                                     unfold"),
      buildOnboardingPage(
        'assets/image1.png',"Join the Olympic Community","    Share your own stories, photos, and  videos,\n  and connect with fellow fans and athletes from   \n                         around the world"
      ),
    ];
  }

  Widget buildOnboardingPage(String imagePath,String title,String description) {
    return Column(
  mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,style:  TextStyle(fontSize: 24, fontWeight: FontWeight.w800),),
        SizedBox(
          height: 10,
        ),
        Text(description,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
        SizedBox(
          height: 10,
        ),
        ClipOval(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 300,
            height: 300,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
     children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: _buildOnboardingPages(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.red,
                dotHeight: 10,
                dotWidth: 10,
                expansionFactor: 3,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back button
              TextButton(
                onPressed: _currentPage == 0
                    ? null
                    : () {
                        _controller.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100,left: 20),
                  child: Text('Back',
                      style: TextStyle(
                          color: _currentPage == 0 ? Colors.grey : Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              // Next button
              Padding(
                padding: const EdgeInsets.only(bottom: 100, right: 20),
                child: GestureDetector(
                  onTap: () {
                    if (_currentPage < 2) {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // Navigate to another screen or complete onboarding
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>Loginpage()));
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
     ]
      ),
    );
  }
}



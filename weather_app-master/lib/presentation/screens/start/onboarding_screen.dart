import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weatherapi/locals/shared.dart';


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2); 
            },
            children: [
              buildPage(
                  color: Colors.blue,
                  title: "Welcome",
                  subtitle: "Explore our app's features",
                  image: Icons.explore),
              buildPage(
                  color: Colors.green,
                  title: "Track Weather Forecast",
                  subtitle: "Stay updated with real-time data",
                  image: Icons.track_changes),
              buildPage(
                  color: Colors.orange,
                  title: "Get Started",
                  subtitle: "Be ready with us",
                  image: Icons.start),
            ],
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                isLastPage
                    ? ElevatedButton(
                        onPressed: () {
                          Shared.putBOOL(key: "done", value: isLastPage);
                          Navigator.pushReplacementNamed(context, '/options');
                        },
                        child: Text("Get Started"),
                      )
                    : TextButton(
                        onPressed: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text("Next"),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildPage({
    required Color color,
    required String title,
    required String subtitle,
    required IconData image,
  }) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(image, size: 100, color: Colors.white),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 20),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:travel_flutter/blocs/ads_bloc.dart';
// import 'package:travel_flutter/blocs/notification_bloc.dart';
// import 'package:travel_flutter/pages/blogs.dart';
// import 'package:travel_flutter/pages/bookmark.dart';
// import 'package:travel_flutter/pages/explore.dart';
import 'package:travel_flutter/pages/profile.dart';
// import 'package:provider/provider.dart';
// import 'package:travel_flutter/pages/states.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  List<IconData> iconList = [
    Feather.home,
    Feather.grid,
    Feather.list,
    Feather.bookmark,
    Feather.user
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(index,
        curve: Curves.easeIn, duration: Duration(milliseconds: 350));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0)).then((value) async {});
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeColor: Theme.of(context).primaryColor,
        gapLocation: GapLocation.none,
        activeIndex: _currentIndex,
        inactiveColor: Colors.grey[800],
        onTap: (index) => onTabTapped(index),
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          // Explore(),
          // StatesPage(),
          // BlogPage(),
          // BookmarkPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}

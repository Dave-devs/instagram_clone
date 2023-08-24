import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/palette.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int _pageIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void navTapped(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  // User user = Provider.of<UserProvider>(context).getUser;

  

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Center(child: Text('Home')),
          Center(child: Text('Search')),
          Center(child: Text('Reels')),
          Center(child: Text('Notifications')),
          Center(child: Text('Profile')),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: navTapped,
        backgroundColor: Palette.bgColor,
        // elevation: 0,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        iconSize: 25.sp,
        currentIndex: _pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: _pageIndex == 0 ? Colors.white : Palette.whiteText,),
            activeIcon: Icon(Icons.home, color: _pageIndex == 0 ? Colors.white : Palette.whiteText,),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined, color: _pageIndex == 1 ? Colors.white : Palette.whiteText,),
            activeIcon: Icon(Icons.search, color: _pageIndex == 1 ? Colors.white : Palette.whiteText,),
            label: 'Search'
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.face_outlined, color: _pageIndex == 2 ? Colors.white : Palette.whiteText,),
            activeIcon: Icon(Icons.face_outlined, color: _pageIndex == 2 ? Colors.white : Palette.whiteText,),
            label: 'Reels'
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline, color: _pageIndex == 3 ? Colors.white : Palette.whiteText,),
            activeIcon: Icon(Icons.favorite, color: _pageIndex == 3 ? Colors.white : Palette.whiteText,),
            label: 'Notifications'
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: _pageIndex == 4 ? Colors.white : Palette.whiteText,),
            activeIcon: Icon(Icons.person, color: _pageIndex == 4 ? Colors.white : Palette.whiteText,),
            label: 'Profile'
          ),
        ],
      ),
    );
  }
}

//Might need to refactor all icon colors

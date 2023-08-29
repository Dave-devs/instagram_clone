import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/palette.dart';
import 'package:instagram_clone/utils_methods/screen_list.dart';

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
        children: screenList
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
            icon: SizedBox(
              width: 24.w,
              height: 24.h,
              child: Image.asset(
                'assets/images/home_outline.png',
                color: _pageIndex == 0 ? Colors.white : Palette.whiteText,
              ),
            ),
            activeIcon: SizedBox(
              width: 24.w,
              height: 24.h,
              child: Image.asset(
                'assets/images/home_filled.png',
                color: _pageIndex == 0 ? Colors.white : Palette.whiteText,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 30.w,
              height: 30.h,
              child: Image.asset(
                'assets/images/search_outline.png',
                color: _pageIndex == 1 ? Colors.white : Palette.whiteText,
              ),
            ),
            activeIcon: SizedBox(
              width: 24.w,
              height: 24.h,
              child: Image.asset(
                'assets/images/search_filled.png',
                color: _pageIndex == 1 ? Colors.white : Palette.whiteText,
              ),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24.w,
              height: 24.h,
              child: Image.asset(
                'assets/images/post_outline.png',
                color: _pageIndex == 2 ? Colors.white : Palette.whiteText,
              ),
            ),
            activeIcon: SizedBox(
              width: 24.w,
              height: 24.h,
              child: Image.asset(
                'assets/images/post_filled.png',
                color: _pageIndex == 2 ? Colors.white : Palette.whiteText,
              ),
            ),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24.w,
              height: 24.h,
              child: Image.asset(
                'assets/images/passion_outline.png',
                color: _pageIndex == 3 ? Colors.white : Palette.whiteText,
              ),
            ),
            activeIcon: SizedBox(
              width: 24.w,
              height: 24.h,
              child: Image.asset(
                'assets/images/passion_filled.png',
                color: _pageIndex == 3 ? Colors.white : Palette.whiteText,
              ),
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24.w,
              height: 24.h,
              child: Image.asset(
                'assets/images/user_outline.png',
                color: _pageIndex == 4 ? Colors.white : Palette.whiteText,
              ),
            ),
            activeIcon: SizedBox(
              width: 24.w,
              height: 24.h,
              child: Image.asset(
                'assets/images/user_filled.png',
                color: _pageIndex == 4 ? Colors.white : Palette.whiteText,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

//Might need to refactor all icon colors

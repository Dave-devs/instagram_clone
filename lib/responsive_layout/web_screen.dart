import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/Core/palette.dart';
import 'package:instagram_clone/utils_methods/screen_list.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {

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

  navigateTapped(int index) {
    pageController.jumpToPage(index);
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/svgs/ic_instagram.svg',
              height: 24.h,
              width: 24.w,
              // ignore: deprecated_member_use
              color: Palette.whiteText,
            ),
            SizedBox(
              width: 2.w,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Expanded(
                  child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: Image.asset(
                  'assets/images/chevron_down.png',
                  color: Palette.whiteText,
                ),
              )),
            ),
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () =>  navigateTapped(0),
              child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: Image.asset(
                  'assets/images/home_ouline.png',
                  color: Palette.whiteText,
                ),
              )),

              GestureDetector(
              onTap: () => navigateTapped(1),
              child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: Image.asset(
                  'assets/images/search_outline.png',
                  color: Palette.whiteText,
                ),
              )),

              GestureDetector(
              onTap: () => navigateTapped(2),
              child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: Image.asset(
                  'assets/images/post_outline.png',
                  color: Palette.whiteText,
                ),
              )),

              GestureDetector(
              onTap: () => navigateTapped(3),
              child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: Image.asset(
                  'assets/images/passion_outline.png',
                  color: Palette.whiteText,
                ),
              )),

              GestureDetector(
              onTap: () => navigateTapped(5),
              child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: Image.asset(
                  'assets/images/user_outline.png',
                  color: Palette.whiteText,
                ),
              )),
        ],
      ),


      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: screenList,
      )
    );
  }
}

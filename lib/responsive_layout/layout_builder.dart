import 'package:flutter/material.dart';
import 'package:instagram_clone/core/app_size.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:provider/provider.dart';

class LayoutScreenBuilder extends StatefulWidget {
  final Widget mobileScreen;
  final Widget webScreen;
  const LayoutScreenBuilder({super.key, required this.mobileScreen, required this.webScreen});

  @override
  State<LayoutScreenBuilder> createState() => _LayoutScreenBuilderState();
}

class _LayoutScreenBuilderState extends State<LayoutScreenBuilder> {

  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth > webSize) {
          return widget.webScreen;
        } else {
          return widget.mobileScreen;
        }
      }
    );
  }
}
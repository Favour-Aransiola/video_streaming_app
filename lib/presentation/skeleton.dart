import 'package:flutter/material.dart';
import 'package:video_streaming_app/app/di.dart';
import 'package:video_streaming_app/presentation/home_screen/home_screen.dart';
import 'package:video_streaming_app/presentation/home_screen/home_view_model.dart';

enum Screens { HOME, BOOKMARK, WATCH, NOTIFICATION, PROFILE }

class Skeleton extends StatefulWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  State<Skeleton> createState() => _SkeletonState();
}

final List<Widget> screens = [HomeScreen()];
int selectedIndex = 0;

class _SkeletonState extends State<Skeleton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color.fromARGB(221, 15, 15, 15),
            borderRadius: BorderRadius.circular(12)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                color: selectedIndex == Screens.HOME.index
                    ? Colors.orange
                    : Colors.yellow,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_outline,
                color: selectedIndex == Screens.BOOKMARK.index
                    ? Colors.orange
                    : Colors.yellow,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.video_camera_back_outlined,
                color: selectedIndex == Screens.WATCH.index
                    ? Colors.orange
                    : Colors.yellow,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: selectedIndex == Screens.NOTIFICATION.index
                    ? Colors.orange
                    : Colors.yellow,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: selectedIndex == Screens.PROFILE.index
                    ? Colors.orange
                    : Colors.yellow,
                size: 30,
              ))
        ]),
      ),
    );
  }
}

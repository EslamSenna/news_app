import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/home/controller.dart';

import 'package:news_app/screens/home/states.dart';

class HomeScreen extends StatelessWidget {
  final changeModeIcon;

  const HomeScreen({Key? key, this.changeModeIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var controller = HomeController.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [changeModeIcon],
              title: Text(
                'News App',
              ),
            ),
            body: controller.business == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.pages[controller.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              items: controller.bottomItems,
              onTap: (index) {
                controller.nav(index);
              },
            ),
          );
        });
  }
}

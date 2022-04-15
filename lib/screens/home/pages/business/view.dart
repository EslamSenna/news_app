import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/home/controller.dart';
import 'package:news_app/screens/home/states.dart';

import '../../widgets/items.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeController, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = HomeController.get(context).business;
        return articleBuilder(list);
      },
    );
  }
}

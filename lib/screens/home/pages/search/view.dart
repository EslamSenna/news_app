import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/home/controller.dart';
import 'package:news_app/screens/home/states.dart';

import '../../widgets/items.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeController, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = HomeController.get(context).search;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DefaultFormField(
                controller: searchController,
                type: TextInputType.text,
                labelText: 'Search',
                onChange: (value) {
                  HomeController.get(context).getSearch(value);
                },
                validator: 'search must not be empty',
                prefixIcon: Icons.search,
              ),
            ),
            Expanded(child: articleBuilder(list)),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/home/widgets/cache_helper.dart';
import 'package:news_app/screens/home/controller.dart';

import 'package:news_app/screens/home/widgets/theme.dart';
import 'package:news_app/screens/home/view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  final value;

  const MyApp({Key? key, this.value}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = CacheHelper.getBoolean(key: 'isDark');

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HomeController()
              ..getBusinessData()
              ..getSportsData()
              ..getScienceData()
              ..getSearch(widget.value))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: isDark ? MyThemes.lightTheme : MyThemes.darkTheme,
        home: ScreenUtilInit(
            builder: () => HomeScreen(
                    changeModeIcon: IconButton(
                  icon: Icon(Icons.brightness_4),
                  onPressed: () {
                    setState(() {
                      isDark = !isDark;
                      CacheHelper.saveBoolean(key: 'isDark', value: isDark);
                      print(isDark);
                      setState(() {});
                    });
                  },
                ))),
        // home: Counter(),
      ),
    );
  }
}

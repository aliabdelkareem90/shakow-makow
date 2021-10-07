import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shakow_makow/cubit/news-states.dart';

import 'cubit/app-blog-observer.dart';
import 'cubit/news-cubit.dart';
import 'layouts/home-layout.dart';
import 'local/shared-pref-helper.dart';
import 'network/dio-helper.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  await SharedPrefHelper.init();
  bool? isDark = SharedPrefHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark!));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (BuildContext context) => NewsCubit()
        ..changeThemeMode(isDarkMode: isDark)
        ..getBusiness()
        ..getSports()
        ..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var appCubit = NewsCubit.get(context);
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedIconTheme: IconThemeData(
                  color: Colors.deepOrange,
                  size: 35.0,
                ),
                unselectedItemColor: Colors.grey.shade700,
                elevation: 20.0,
                backgroundColor: Colors.white,
              ),
              textTheme: TextTheme(
                headline1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('202020'),
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('202020'),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('2a2a2a'),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedIconTheme: IconThemeData(
                  color: Colors.deepOrange,
                  size: 35.0,
                ),
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor('2a2a2a'),
              ),
              textTheme: TextTheme(
                headline1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              cardTheme: CardTheme(
                color: HexColor('2a2a2a'),
              ),
            ),
            themeMode: appCubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: HomePage(),
            ),
          );
        },
      ),
    );
  }
}

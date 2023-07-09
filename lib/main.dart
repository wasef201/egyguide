import 'package:bloc/bloc.dart';
import 'package:egyuide/layout/cubit/cubit.dart';
import 'package:egyuide/layout/cubit/states.dart';
import 'package:egyuide/layout/home.dart';
import 'package:egyuide/modules/onboarding/onboarding.dart';
import 'package:egyuide/modules/user/cubit/cubit.dart';
import 'package:egyuide/modules/user/login.dart';
import 'package:egyuide/spalsh.dart';
import 'package:egyuide/utilities/bloc_observer.dart';
import 'package:egyuide/utilities/cache_helper.dart';
import 'package:egyuide/utilities/constants.dart';
import 'package:egyuide/utilities/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();
  late Widget widget;

  bool? onBoarding = await CacheHelper.getData(key: 'onBoarding');
  token = await CacheHelper.getData(key: 'token');
  username = await CacheHelper.getData(key: 'username');
  email = await CacheHelper.getData(key: 'email');
  userID = await CacheHelper.getData(key: 'userID');
  darkmode = await CacheHelper.getData(key: 'darkMode') ?? false;

  if (onBoarding != null) {
    if (token != null) {
      widget = Home();
    } else {
      widget = LogIn();
    }
  } else {
    widget = Onboard();
  }

  runApp(MyApp(
    widget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget widget;

  const MyApp({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers:
      [
        BlocProvider( create: (context) => AppCubit()..getHomePosts()..getTopRanked()..updatedUnFollowedUsers()),
        BlocProvider( create: (context) => LoginCubit(),),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder:(context, state) {
          var cubit = AppCubit.get(context);
          cubit.darkMode = darkmode;
          return MaterialApp(
          home: Splash(
            widget: widget,
          ),
          debugShowCheckedModeBanner: false,
          title: 'Egy Guide',
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('ar'), // English
          ],
          theme: ThemeData(fontFamily: 'cairo'),
          themeMode: cubit.darkMode  ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black45,
          ),
        );
        },
      ),
    );
  }
}

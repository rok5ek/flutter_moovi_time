import 'package:flutter/material.dart';
import 'package:moovi_time/di/dependency_injector.dart';
import 'package:moovi_time/presentation/navigation/app_router.dart';
import 'package:moovi_time/presentation/navigation/app_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inject all the dependencies and wait for it is done (i.e. UI won't built until all the dependencies are injected)
  await initDependencies();

  // style status bar and navigation bar
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //       statusBarColor: AppColors.transparent,
  //       systemNavigationBarColor: AppColors.white,
  //       systemNavigationBarIconBrightness: Brightness.dark),
  // );
  /*ErrorWidget.builder = (FlutterErrorDetails details) {
    return AppErrorWidget.build(details);
  };*/
  runApp(const MovieTimeApp());
}

class MovieTimeApp extends StatefulWidget {
  const MovieTimeApp({Key? key}) : super(key: key);

  @override
  State<MovieTimeApp> createState() => _MovieTimeAppState();
}

class _MovieTimeAppState extends State<MovieTimeApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MooviTime',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppScreens.home,
      onGenerateRoute: getIt<AppRouter>().onGenerateRoute,
    );
  }
}

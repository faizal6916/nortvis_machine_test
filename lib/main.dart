import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nortvis/dishes_list/view_models/dishes_view_model.dart';
import 'package:provider/provider.dart';
import './home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MultiProvider(providers: [
          ChangeNotifierProvider(create: (_)=>DishesViewModel())
        ],child:MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            //textTheme: TextTheme(bodyText2: TextStyle(fontSize: 10.sp)),
          ),
          home: child,
        ) ,);
        
      },
      child: HomeScreen(),
    );
  }
}



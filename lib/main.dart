import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:testzaina/screen/login/home.dart';
import 'package:testzaina/screen/login/signin.dart';
import 'package:testzaina/screen/product/add_product.dart';


import 'bloc_provider.dart';
import 'network/cach_helper.dart';
import 'network/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding();
  Bloc.observer=MyBlocObserver();
  DioHelper.init();
 await CachHelper.init();
  Widget widget;
   var token=CachHelper.getData(key: 'token');
   if( token==null){
     widget=sign();
   }
   else {widget=home();
   print('hello');
  }
  runApp( MyApp(startwidget: widget,));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
   late final Widget startwidget;
   MyApp({required this.startwidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:sign(),
    );
  }
}

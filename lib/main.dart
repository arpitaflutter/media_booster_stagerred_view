import 'package:flutter/material.dart';
import 'package:media_booster_stagerred_view/screens/home/provider/home_provider.dart';
import 'package:media_booster_stagerred_view/screens/home/view/home_screen.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => home_provider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => home_screen()
        },
      ),
    ),
  );
}
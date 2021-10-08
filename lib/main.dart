import 'package:chat_app/modules/my_provider.dart';
import 'package:chat_app/screens/home_page.dart';
import 'package:chat_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(
        MultiProvider(
            providers: [
                ChangeNotifierProvider(create: (_) => MyProvider()),
            ],
            child: const MyApp(),
        )
    );
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Chat App Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: context.watch<MyProvider>().user == null 
            ? const Login()
            : const HomePage()
        );
    }
}



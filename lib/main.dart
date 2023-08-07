import 'package:excercise_bloc/bloc/contact_bloc.dart';
import 'package:excercise_bloc/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ContactBloc())],
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}

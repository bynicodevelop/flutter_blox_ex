import 'package:app_state_mamagment/repositories/abstracts/inc_respository.dart';
import 'package:app_state_mamagment/repositories/inc_impl_repository.dart';
import 'package:app_state_mamagment/screens/home_screen.dart';
import 'package:app_state_mamagment/services/increment/increment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    IncRepository incRepository = IncImplRespository();

    return MultiBlocProvider(
      providers: [
        BlocProvider<IncrementBloc>(
          create: (context) => IncrementBloc(incRepository),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

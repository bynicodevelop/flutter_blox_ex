import 'package:app_state_mamagment/repositories/abstracts/inc_respository.dart';
import 'package:app_state_mamagment/repositories/inc_impl_repository.dart';
import 'package:app_state_mamagment/screens/home_screen.dart';
import 'package:app_state_mamagment/services/increment/increment_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  runApp(App(firestore: firestore));
}

class App extends StatelessWidget {
  final FirebaseFirestore firestore;

  App({
    required this.firestore,
  });

  @override
  Widget build(BuildContext context) {
    IncRepository incRepository = IncImplRespository(
      firestore: firestore,
    );

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

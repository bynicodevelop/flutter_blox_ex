import 'package:app_state_mamagment/screens/profile_screen.dart';
import 'package:app_state_mamagment/services/increment/increment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final List<String> items; 


  const HomeScreen({Key? key, required this.items,}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _inc = 0;

  @override
  void initState() {
    print("InitState");
    super.initState();

    setState(() => _inc = 20);

    context.read<IncrementBloc>().add(IncrementInitialEvent());

    // CODE

    setState(() => {});

    // CODE
  }

  @override
  void dispose() {
    print("Dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    // print(size);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () =>
                        context.read<IncrementBloc>().add(IncrementAddEvent()),
                    child: Text("Coucou"),
                  ),
                ),
                BlocBuilder<IncrementBloc, IncrementState>(
                  builder: (context, state) {
                    return Text(
                      "Nom de clics : ${(state as IncrementInitialState).inc}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                      (route) => false,
                    ),
                    child: Text("Profile"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

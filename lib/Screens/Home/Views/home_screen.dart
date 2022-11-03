// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vexa_flashcards/Common/GlobalFunctions.dart';
import 'package:vexa_flashcards/Common/Navigator.dart';
import 'package:vexa_flashcards/Screens/Home/Widgets/home_widget.dart';
import 'package:vexa_flashcards/Screens/Matter/Views/add_matter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(child: HomeWidget().buildMenu()),
      appBar: AppBar(
        leading: IconButton(onPressed: () => scaffoldKey.currentState?.openDrawer(), icon: Icon(Icons.menu_outlined, color: Colors.black)),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text("Matérias", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
              onPressed: () async {
                await NavigatorController().navigatorToReturn(context, AddMetter());
                RestartScreenHotRestart(context);
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(14.0), child: HomeWidget().FutureMatterList(context)),
    );
  }
}

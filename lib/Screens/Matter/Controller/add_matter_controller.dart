import 'package:flutter/material.dart';
import 'package:vexa_flashcards/Common/Navigator.dart';
import 'package:vexa_flashcards/Common/SQLiteHelper.dart';
import 'package:vexa_flashcards/Screens/Matter/Models/Matter.dart';
import 'package:vexa_flashcards/Screens/Matter/Widget/add_matter_widgets.dart';

class AddMatterController {
  Function() SaveMatter(BuildContext context, AddMatterWigdet addMatterWigdet) {
    return () async {
      Matter matterAux = Matter(memory: 0, title: addMatterWigdet.titleEditingController.text, color: addMatterWigdet.selectColorOption.toString());
      int id_matter = await DatabaseHelper().insertDatabase("matter", matterAux);
      NavigatorController().navigatorBack(context);
    };
  }
}

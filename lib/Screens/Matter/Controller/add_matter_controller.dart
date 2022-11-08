// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, unused_local_variable, avoid_single_cascade_in_expression_statements, prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:vexa_flashcards/Common/Navigator.dart';
import 'package:vexa_flashcards/Common/SQLiteHelper.dart';
import 'package:vexa_flashcards/Screens/Matter/Models/Matter.dart';
import 'package:vexa_flashcards/Screens/Matter/Widget/add_matter_widgets.dart';

class AddMatterController {
  Function() SaveMatter(BuildContext context, AddMatterWigdet addMatterWigdet) {
    return () async {
      if (addMatterWigdet.titleEditingController.text.isEmpty) {
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.error,
          body: Center(
            child: Text(
              "Adicione um título para sua matéria",
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          // title: 'This is Ignored',
          autoHide: Duration(seconds: 4),
          headerAnimationLoop: false,
          // desc: 'This is also Ignored',
          btnCancelOnPress: (){},
          btnCancelText: "OK"
        )..show();
      } else if (addMatterWigdet.listCards.length <= 2) {
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.error,
          body: Center(
            child: Text(
              "Adicione pelo menos três carta na sua nova matéria ${addMatterWigdet.titleEditingController.text}",
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          // title: 'This is Ignored',
          autoHide: Duration(seconds: 4),
          headerAnimationLoop: false,
          // desc: 'This is also Ignored',
          btnCancelOnPress: (){},
          btnCancelText: "OK"
        )..show();
      } else {
        Matter matterAux = Matter(memory: 0, title: addMatterWigdet.titleEditingController.text, color: addMatterWigdet.selectColorOption.toString());
        int id_matter = await DatabaseHelper().insertDatabase("matter", matterAux);
        for (var element in addMatterWigdet.listCards) {
          element.id_matter = id_matter;
          await DatabaseHelper().insertDatabase("card", element);
        }
        NavigatorController().navigatorBack(context);
      }
    };
  }
}

// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vexa_flashcards/Common/GlobalFunctions.dart';

class AddMatterWigdet {
  TextEditingController titleEditingController = TextEditingController();
  bool selectColor = false;
  Color selectColorOption = Colors.white;
  String colorString = Colors.white.toString();
  bool boolValidationTitle = true;

  Widget TitleTextField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ErrorIcon(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 170,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w700),
                  keyboardType: TextInputType.name,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  cursorColor: const Color.fromARGB(255, 85, 58, 1),
                  decoration: InputDecoration(
                    hintText: "Título",
                    border: InputBorder.none,
                  ),
                  controller: titleEditingController,
                  onChanged: (value) {
                    boolValidationTitle = value.isEmpty;
                    RestartScreenHotRestart(context);
                  },
                  autofocus: true,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                selectColor = selectColor ? false : true;
                (context as Element).reassemble();
              },
              child: CircleAvatar(
                radius: 14,
                backgroundColor: selectColorOption == Colors.white ? Colors.grey : selectColorOption,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: selectColorOption,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget ColorsWidgets(BuildContext context) {
    if (selectColor) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircularColor(context, Colors.red[300]),
          CircularColor(context, Colors.orange[300]),
          CircularColor(context, Colors.green[300]),
          CircularColor(context, Colors.black),
          CircularColor(context, Colors.white),
          CircularColor(context, Colors.blue[300]),
          CircularColor(context, Colors.brown[300]),
          CircularColor(context, Colors.deepPurpleAccent),
        ],
      );
    } else {
      return SizedBox();
    }
  }

  Widget CircularColor(BuildContext context, Color? color) {
    return GestureDetector(
      onTap: () {
        selectColorOption = color!;
        colorString = color.toString();
        selectColor = false;
        RestartScreenHotRestart(context);
      },
      child: CircleAvatar(
        radius: 13,
        backgroundColor: color,
      ),
    );
  }

  Widget ErrorIcon() {
    return Icon(
      Icons.error,
      color: boolValidationTitle ? Colors.red : Colors.transparent,
    );
  }

   Widget ButtonAdd(BuildContext context, Function() function) {
    return SizedBox(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(style: styleButtonDefaut(Colors.green), onPressed: function, child: Text("Adicionar", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white))),
      ),
    );
  }
}

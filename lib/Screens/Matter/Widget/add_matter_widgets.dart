// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vexa_flashcards/Common/GlobalFunctions.dart';
import 'package:vexa_flashcards/Screens/Card/Widgets/add_card_widgets.dart';
import 'package:vexa_flashcards/Screens/Home/Models/Cards.dart';

class AddMatterWigdet {
  TextEditingController titleEditingController = TextEditingController();
  bool selectColor = false;
  Color? selectColorOption = Colors.green[900];
  String colorString = Colors.green[900].toString();
  bool boolValidationTitle = true;
  AddCardWidgets addCardWidgets = AddCardWidgets();
  List<Cards> listCards = [];

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
                  autocorrect: true,
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

  Widget ResumWidget(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        width: getSize(context).width * 0.9,
        height: 100,
        decoration: BoxDecoration(color: selectColorOption, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: getSize(context).width * 0.7,
                  child: Text(titleEditingController.text.isEmpty ? "Sem título" : titleEditingController.text,
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cartas: ${listCards.length}", textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300, color: Colors.white)),
              )
            ],
          ),
        ));
  }

  Widget ColorsWidgets(BuildContext context) {
    return Visibility(
      visible: selectColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircularColor(context, Colors.red[900]),
          CircularColor(context, Colors.orange[900]),
          CircularColor(context, Colors.green[900]),
          CircularColor(context, Colors.black),
          CircularColor(context, Colors.grey[900]),
          CircularColor(context, Colors.blue[900]),
          CircularColor(context, Colors.brown[900]),
          CircularColor(context, Colors.deepPurpleAccent),
        ],
      ),
    );
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

  Widget AddCardbutton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Cards cardAux = await addCardWidgets.modalAddWidget(context);
        listCards.add(cardAux);
        RestartScreenHotRestart(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.add),
          ),
          Text("Adicionar um cartão")
        ],
      ),
    );
  }

  Widget ButtonAdd(BuildContext context, Function() function) {
    return SizedBox(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: styleButtonDefaut(Colors.green[700]), onPressed: function, child: Text("Adicionar", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white))),
      ),
    );
  }

  Widget BuildCards(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        for (var i = 0; i < listCards.length; i++)
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 30,
              decoration: BoxDecoration(color: selectColorOption, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${listCards[i].question!.length > 22 ? "...${listCards[i].question!.substring(listCards[i].question!.length-22, listCards[i].question!.length)}" : listCards[i].question}",
                        style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400)),
                    Text("${i + 1}º", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400))
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

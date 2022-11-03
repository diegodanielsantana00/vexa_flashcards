// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vexa_flashcards/Common/GlobalFunctions.dart';
import 'package:vexa_flashcards/Screens/Home/Models/Cards.dart';

class AddCardWidgets {
  bool errorQuestion = false;
  TextEditingController questionEditingController = TextEditingController();

  modalAddWidget(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Stack(
              //overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        // errorBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Colors.red,
                        //   ),
                        //   borderRadius: BorderRadius.circular(10.0),
                        // ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[600] ?? Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Pergunta",
                        //errorText: errorQuestion ? "Ooops, something is not right!" : "",
                        //errorStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                      ),
                      controller: questionEditingController
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          // errorBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: Colors.red,
                          //   ),
                          //   borderRadius: BorderRadius.circular(10.0),
                          // ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey[600] ?? Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: "Resposta",
                          //errorText: "Ooops, something is not right!",
                          //errorStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    ButtonAdd(context, (){
                      Navigator.pop(context, Cards(
                        question: questionEditingController.text
                      ));
                    }),


                  ],
                ),
              ],
            ),
          );
        });
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
}

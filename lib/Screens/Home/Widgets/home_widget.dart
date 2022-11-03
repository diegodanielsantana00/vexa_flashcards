// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vexa_flashcards/Common/GlobalFunctions.dart';
import 'package:vexa_flashcards/Screens/Matter/Models/Matter.dart';
import 'package:vexa_flashcards/Screens/Matter/Models/MatterContext.dart';

class HomeWidget {
  
  Widget FutureMatterList(BuildContext context) {
    return FutureBuilder<List<Matter>>(
      future: MatterContext().GetTask(),
      builder: (BuildContext context, AsyncSnapshot<List<Matter>> snapshot) {
        if (snapshot.hasData) {
          return BuildListMetter(context, snapshot.data??[]);
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 370,
              height: 100,
              decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ],
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 370,
              height: 100,
              decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: const CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget BuildListMetter(BuildContext context, List<Matter> listMatter) {
    return SafeArea(
      child: ListView.builder(
        itemCount: listMatter.length,
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 100,
              decoration: BoxDecoration(color: StringToColor(listMatter[index].color??""), borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: getSize(context).width * 0.7,
                        child: Text(listMatter[index].title??"", textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Memorizados: ${listMatter[index].memory??0}/65", textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300, color: Colors.white)),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Icon(Icons.account_circle, size: 60, ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Olá, Diego Daniel",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.card_membership_sharp, size: 20.0, color: Colors.black),
            title: const Text("Cartões"),
            textColor: Colors.black,
            dense: true,
          ),
          // ListTile(
          //   onTap: () {},
          //   leading:
          //       const Icon(Icons.settings, size: 20.0, color: Colors.black),
          //   title: const Text("Configuração"),
          //   textColor: Colors.black,
          //   dense: true,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: widgetVersionText()
          )
        ],
      ),
    );
  }
}

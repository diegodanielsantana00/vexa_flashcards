import 'package:flutter/material.dart';
import 'package:vexa_flashcards/Common/GlobalFunctions.dart';
import 'package:vexa_flashcards/Screens/Home/Models/Matter.dart';
import 'package:vexa_flashcards/Screens/Home/Models/MatterContext.dart';

class HomeWidget {
  Widget FutureMatterList(BuildContext context) {
    return FutureBuilder<List<Matter>>(
      future: MatterContext().GetTask(),
      builder: (BuildContext context, AsyncSnapshot<List<Matter>> snapshot) {
        if (snapshot.hasData) {
          return BuildListMetter(context);
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
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget BuildListMetter(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: getSize(context).width * 0.7,
              child: Text("Humanismo e Cidadania de matematica avançada", textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Progresso: 11/65", textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300, color: Colors.white)),
          )
        ],
      ),
    );
  }
}

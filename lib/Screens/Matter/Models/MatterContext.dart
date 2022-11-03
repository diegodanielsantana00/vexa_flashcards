// ignore_for_file: non_constant_identifier_names, file_names


import 'package:vexa_flashcards/Common/SQLiteHelper.dart';
import 'package:vexa_flashcards/Screens/Matter/Models/Matter.dart';

class MatterContext {
  Future<List<Matter>> GetTask() async {
    List<Matter> resultAux = await DatabaseHelper().getMatter();
    return resultAux;
  }
}

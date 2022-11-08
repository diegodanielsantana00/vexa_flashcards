import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vexa_flashcards/Common/Navigator.dart';
import 'package:vexa_flashcards/Common/SQLiteHelper.dart';
import 'package:vexa_flashcards/Screens/Matter/Controller/add_matter_controller.dart';
import 'package:vexa_flashcards/Screens/Matter/Models/Matter.dart';
import 'package:vexa_flashcards/Screens/Matter/Widget/add_matter_widgets.dart';

class AddMetter extends StatefulWidget {
  const AddMetter({super.key});

  @override
  State<AddMetter> createState() => _AddMetterState();
}

class _AddMetterState extends State<AddMetter> {
  AddMatterWigdet addMatterWigdet = AddMatterWigdet();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adcionar uma matéria", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => NavigatorController().navigatorBack(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            addMatterWigdet.TitleTextField(context),
            addMatterWigdet.ColorsWidgets(context),
            addMatterWigdet.AddCardbutton(context),
            addMatterWigdet.ResumWidget(context),
            addMatterWigdet.BuildCards(context),
            addMatterWigdet.ButtonAdd(context, AddMatterController().SaveMatter(context, addMatterWigdet)),
          ],
        ),
      ),
    );
  }
}

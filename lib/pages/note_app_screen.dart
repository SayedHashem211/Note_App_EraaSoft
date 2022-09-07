import 'package:flutter/material.dart';

import '../models/card_model.dart';

class NoteApp extends StatefulWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  State<NoteApp> createState() => _NoteAppState();
}

class Notes {
  String body;

  Notes({required this.body});
}

class _NoteAppState extends State<NoteApp> {
  //list of all Notes
  List allNotes = [
    Notes(body: "الصبر هو الفضيلة الأولى التي يتعلّمها الراعي."),
    Notes(body: "خلقت الفرص لكي تقتنص على الفور..!"),
    Notes(body: "الطريق التي تقطعها لا تقل أهمية عن المكان الذي ستصل إليه."),
    Notes(body: "غدا كل شيء سيكون جيداً..! "),
  ];

  // To delete card-Note when clicking on delete icon
  deleteCard(Notes item) {
    setState(() {
      allNotes.remove(item);
    });
  }

  // create 2 controllers to get the text from the text field
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  // To add new card-Note to the main screen when clicking on "ADD" in showModelBottomSheet
  addNewQuote() {
    setState(() {
      allNotes.add(Notes(body: myController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 50, 57, 121),
          title: const Text(
            "Note App",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...allNotes
                  .map((item) => CardWidget(
                        // To pass the item inside the list to "card.dart" file
                        item: item,
                        itsBody: item.body,
                        // To pass the delete function to "card.dart" file
                        deleteCard: deleteCard,
                      ))
                  .toList()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          decoration:
                              const InputDecoration(hintText: "Add new Note"),
                          maxLength: 20,
                          controller: myController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              addNewQuote();
                            },
                            child: const Text("ADD NOTE",
                                style: TextStyle(fontSize: 22))),
                      ],
                    ),
                  );
                });
          },
          backgroundColor: Colors.redAccent,
          child: const Icon(Icons.add),
        ));
  }
}

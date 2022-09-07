import 'package:flutter/material.dart';

import '../pages/note_app_screen.dart';

class CardWidget extends StatelessWidget {
  final String itsBody;
  final Function deleteCard;
  final Notes item;

  const CardWidget(
      {Key? key,
      required this.itsBody,
      required this.deleteCard,
      required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 57, 66, 151),
      margin: const EdgeInsets.all(11),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      child: Container(
        padding: const EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              itsBody,
              style: const TextStyle(
                fontSize: 27,
                color: Colors.white,
              ),
              textDirection: TextDirection.rtl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    deleteCard(item);
                  },
                  icon: const Icon(
                    Icons.delete,
                  ),
                  iconSize: 27,
                  color: const Color.fromARGB(255, 255, 217, 217),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

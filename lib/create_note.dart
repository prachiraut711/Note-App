import 'package:flutter/material.dart';
import 'package:notes_app/home_screen_controller.dart';
import 'package:notes_app/note_model.dart';

class CreateNote extends StatefulWidget {
  final HomeScreenController homeScreenController;
  
  const CreateNote({super.key, required this.homeScreenController});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  void _showSaveDialog() {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("save changes"),
          content: const Text("Do you want to save this note ?"),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: const Text("Cancel"),
           ),
           TextButton(onPressed: (){
            if(titleController.text.isNotEmpty || bodyController.text.isNotEmpty) {
              widget.homeScreenController.noteList.add(
                NoteModel(title: titleController.text, subtitle: bodyController.text)
              );
            }
            Navigator.of(context).pop();
            Navigator.of(context).pop();
           }, child: const Text("Save"))
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note"),
        actions: [
          IconButton(onPressed: _showSaveDialog, icon: const Icon(Icons.note_add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: const TextStyle(fontSize: 30),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
              ),
            ),
        
            const SizedBox(
              height: 21,
            ),
        
            TextField(
              controller: bodyController,
              style: const TextStyle(fontSize: 18),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Type Something Here.."
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
          ],
        ),
      ),
    );
  }
}



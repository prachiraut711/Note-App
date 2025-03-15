import 'package:flutter/material.dart';
import 'package:notes_app/create_note.dart';
import 'package:notes_app/home_screen_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeScreenController homeScreenController = HomeScreenController();

  
  @override
  Widget build(BuildContext context) {

    return Obx(() {
      return Scaffold(
      appBar: AppBar(
        title: const Text("Notes",style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.settings)),
        ],
      ),

      body: homeScreenController.noteList.isEmpty 
         ? const Center(child: Text("No Notes Available!!", style: TextStyle(fontSize: 18),))
         : ListView.builder(
          itemCount:  homeScreenController.noteList.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 67, 62, 62),
                  borderRadius: BorderRadius.circular(21)
                ),
                child: ListTile(
                title: Text( homeScreenController.noteList[index].title),
                subtitle: Text(homeScreenController.noteList[index].subtitle),
              ),
             ),
            );
         }),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateNote(homeScreenController: homeScreenController,)),
          );
        },
        child: const Icon(Icons.add),
      ),
      );
    });
  }
}
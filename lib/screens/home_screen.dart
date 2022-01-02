import 'package:flutter/material.dart';
import 'package:notes_bloc/screens/add_note_screen.dart';
import 'package:notes_bloc/widgets/text_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffF2F3F7),
        elevation: 0,
        centerTitle: true,
        title: const TextTitle(
            text: 'Mis Notas', fontWeight: FontWeight.w500, fontSize: 21),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.grid_view_rounded,
              color: Colors.black,
            ),
            // icon: const Icon(
            //   Icons.table_rows,
            //   color: Colors.black,
            // ),
          )
        ],
      ),
      body: const SafeArea(
        child: Center(
          child: TextTitle(text: 'No hay notas', color: Colors.grey),
        ),
      ),
      floatingActionButton: InkWell(
        borderRadius: BorderRadius.circular(50.0),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const AddNoteScreen())),
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
              color: Color(0xff1977F3),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.blue, blurRadius: 10, spreadRadius: -5.0)
              ]),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

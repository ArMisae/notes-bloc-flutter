import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_bloc/bloc/notes/notes_bloc.dart';
import 'package:notes_bloc/helpers/show_dialog_buttom.dart';
import 'package:notes_bloc/widgets/text_title.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 60,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xffF6F8F9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: TextTitle(text: 'Categoria'),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            alignment: Alignment.center,
            height: 40,
            width: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(color: Colors.grey, blurRadius: 7, spreadRadius: -5.0)
              ],
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(15.0),
              onTap: () => showDialogBottom(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<NotesBloc, NotesState>(
                      builder: (BuildContext context, state) => Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: state.colorCategory, width: 4.0),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                    ),
                    BlocBuilder<NotesBloc, NotesState>(
                      builder: (BuildContext context, state) => TextTitle(
                        text: state.category,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Icon(Icons.expand_more)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

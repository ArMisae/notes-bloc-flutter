import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_bloc/models/note_model.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(const NotesState()) {
    on<NotesEvent>((event, emit) {});
    on<SelectedCategoryEvent>(
      (event, emit) => {
        emit(
          state.copyWith(
              category: event.category, colorCategory: event.colorCategory),
        )
      },
    );
    on<SelectedColorEvent>(
      (event, emit) => {
        emit(
          state.copyWith(color: event.color),
        ),
      },
    );
    on<ChangedListToGrid>(
      (event, emit) => emit(
        state.copyWith(isList: event.isList),
      ),
    );
    on<AddNoteEvent>(
      (event, emit) async {
        var box = await Hive.openBox<NoteModel>('notes');

        var noteModel = NoteModel(
          title: event.title,
          body: event.body,
          category: event.category,
          color: event.color,
          created: event.created,
          isComplete: event.isComplete,
        );

        box.add(noteModel);
      },
    );
    on<DeleteNoteEvent>((event, emit) async {
      var box = await Hive.openBox<NoteModel>('notes');

      box.deleteAt(event.index);
    });
    on<UpdateNoteEvent>(
      (event, emit) async {
        var box = await Hive.openBox<NoteModel>('notes');

        var noteModel = NoteModel(
          title: event.title,
          body: event.body,
          category: event.category,
          color: event.color,
          created: event.created,
          isComplete: event.isComplete,
        );

        box.putAt(event.index, noteModel);
      },
    );
  }
}

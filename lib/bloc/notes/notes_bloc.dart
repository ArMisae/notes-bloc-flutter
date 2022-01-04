import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

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
  }
}

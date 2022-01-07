part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

class SelectedCategoryEvent extends NotesEvent {
  final String category;
  final Color colorCategory;

  SelectedCategoryEvent(this.category, this.colorCategory);
}

class SelectedColorEvent extends NotesEvent {
  final int color;

  SelectedColorEvent(this.color);
}

class ChangedListToGrid extends NotesEvent {
  final bool isList;

  ChangedListToGrid(this.isList);
}

class AddNoteEvent extends NotesEvent {
  final String title;
  final String body;
  final bool isComplete;
  final int color;
  final String category;
  final DateTime created;

  AddNoteEvent(
      {required this.title,
      required this.body,
      required this.isComplete,
      required this.color,
      required this.category,
      required this.created});
}

class DeleteNoteEvent extends NotesEvent {
  final int index;

  DeleteNoteEvent(this.index);
}

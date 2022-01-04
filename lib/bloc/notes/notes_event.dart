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

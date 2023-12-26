part of 'searched_books_cubit.dart';

abstract class SearchedBooksState extends Equatable {
  const SearchedBooksState();

  @override
  List<Object> get props => [];
}

final class SearchedBooksInitial extends SearchedBooksState {}

final class SearchedBooksLoading extends SearchedBooksState {}

final class SearchedBooksSuccess extends SearchedBooksState {
  final List<BookModel> books;

  const SearchedBooksSuccess(this.books);
}

final class SearchedBooksFailure extends SearchedBooksState {
  final String errMessage;

  const SearchedBooksFailure(this.errMessage);
}

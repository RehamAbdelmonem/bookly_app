import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/search/data/repo/search_repo.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit(this.searchRepo) : super(SearchedBooksInitial());

  
  final SearchRepo searchRepo;

  Future<void> fetchSearchedBooks({required String userSearch}) async {
    emit(SearchedBooksLoading());
    var result = await searchRepo.fetchSearchedBooks();

    result.fold((failure) {
      emit(SearchedBooksFailure(failure.errMessage));
    } , (books) {
      emit(SearchedBooksSuccess(books));
    });
  }
}

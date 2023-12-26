import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/models/book_model/book_model.dart';

abstract class SearchRepo{
  Future<Either<Failure,List<BookModel>>> fetchSearchedBooks();
  
}
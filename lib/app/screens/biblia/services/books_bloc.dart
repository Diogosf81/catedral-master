import 'package:catedral/app/screens/biblia/models/book.dart';
import 'package:catedral/app/screens/biblia/models/dao/books_dao.dart';
import 'package:catedral/app/screens/biblia/services/base_bloc.dart';
import 'package:catedral/app/screens/biblia/utils/constants.dart';

class BooksBloc extends BaseBloc<List<Book>> {
  final BooksDao _dao = BooksDao();

  Future<List<Book>?> book(int bookID) async {
    try {
      List<Book>? books = (await _dao.bookById(bookID)).cast<Book>();
      add(books);
      return books;
    } catch (e) {
      addError(e);
      return null;
    }
  }

  Future<List<Book>?> booksList(Testament testament) async {
    try {
      List<Book>? books = (await _dao.booksList(testament)).cast<Book>();
      add(books);
      return books;
    } catch (e) {
      addError(e);
      return null;
    }
  }

  // Future<Book>markedChapters(Book book) async {
  //   List<int> marked = [];
  //   List<Book> books = [];
  //
  //   List<Favorite>? favList = (await _dao.markedChapters(book)).cast<Favorite>();
  //   favList.forEach((l) => marked.add(l.verse.chapter));
  //   book.markedList = marked;
  //
  //   books.add(book);
  //   add(books);
  //
  //   return book;
  // }

  booksTitle(Testament testament) {
    String title;

    switch (testament) {
      case Testament.AT:
        {
          title = "Velho Testamento";
          break;
        }
      case Testament.NT:
        title = "Novo Testamento";
        break;
      default:
        title = "Todos os livros";
    }
    return title;
  }
}

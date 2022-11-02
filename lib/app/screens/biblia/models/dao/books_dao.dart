import 'package:catedral/app/screens/biblia/models/book.dart';
import 'package:catedral/app/screens/biblia/models/dao/base_dao.dart';
import 'package:catedral/app/screens/biblia/utils/constants.dart';

class BooksDao extends BaseDAO<Book> {
  @override
  String get tableName => "BooksList";
  String get favoriteTable => "Favorites";

  @override
  Book fromMap(Map<String, dynamic> map) {
    return Book.fromMap(map);
  }

  Future<List<Book>> bookById(bookID) async {
    return await query(
      "select * from $tableName where Book=? order by Book",
      [bookID],
    );
  }

  Future<List<Book>> booksList(Testament testament) async {
    if (testament == Testament.ALL) {
      return await query(
        "select * from $tableName order by Book",
      );
    } else {
      int t = (testament == Testament.AT) ? 1 : 2;
      return await query(
        "select * from $tableName where Testament=? order by Book",
        [t],
      );
    }
  }

  // Future<List<Favorite>> markedChapters(Book book) async {
  //   FavoriteDao dao = FavoriteDao();
  //
  //   String sql = "select * from $favoriteTable where Type=? and Book=?";
  //   List<Favorite> favList =
  //       await dao.query(sql, [FavoriteType.MARKED.index, book.bookID]);
  //
  //   return favList;
  // }
}

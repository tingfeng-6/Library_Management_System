package fun.juhua.library_springboot.service;

import fun.juhua.library_springboot.entity.Book;

import java.util.List;

public interface BookService {
    List<Book> getBookList(String bookName, String bookID, String bookAuthor, String isbn, String tag, String publishYm);

    Book findById(String bookID);

    int updateBook(Book book);

    int deleteBook(String bookID);

    int addBook(Book book);

    int returnBook(String bookID);

    int check(String bookID);


}

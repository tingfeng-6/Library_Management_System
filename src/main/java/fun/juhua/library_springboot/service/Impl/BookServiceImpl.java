package fun.juhua.library_springboot.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import fun.juhua.library_springboot.entity.Book;
import fun.juhua.library_springboot.mapper.BookMapper;
import fun.juhua.library_springboot.service.BookService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import fun.juhua.library_springboot.utils.DateUtils;

@Service
public class BookServiceImpl implements BookService {
    @Resource
    BookMapper bookMapper;

    @Override
    public List<Book> getBookList(String bookName, String bookID, String bookAuthor, String isbn, String tag, String publishYm) {
        QueryWrapper<Book> wrapper = new QueryWrapper<>();

        boolean hasCondition = false;

        if (bookName != null && !bookName.trim().isEmpty()) {
            wrapper.like("bookName", bookName.trim());
            hasCondition = true;
        }
        if (bookID != null && !bookID.trim().isEmpty()) {
            wrapper.eq("bookID", bookID.trim());
            hasCondition = true;
        }
        if (bookAuthor != null && !bookAuthor.trim().isEmpty()) {
            wrapper.like("bookAuthor", bookAuthor.trim());
            hasCondition = true;
        }
        if (isbn != null && !isbn.trim().isEmpty()) {
            wrapper.like("isbn", isbn.trim());
            hasCondition = true;
        }
        if (tag != null && !tag.trim().isEmpty()) {
            wrapper.like("tag", tag.trim());
            hasCondition = true;
        }
        if (publishYm != null && !publishYm.trim().isEmpty()) {
            try {
                String startStr = publishYm.trim() + "-01 00:00:00";
                Date start = new DateUtils().toDate(startStr);
                Calendar cal = Calendar.getInstance();
                cal.setTime(start);
                cal.add(Calendar.MONTH, 1);
                cal.add(Calendar.SECOND, -1);
                Date end = cal.getTime();
                wrapper.between("publishTime", start, end);
                hasCondition = true;
            } catch (Exception ignored) {
            }
        }

        if (!hasCondition) {
            return bookMapper.selectList(null);
        }
        return bookMapper.selectList(wrapper);
    }

    @Override
    public Book findById(String bookID) {
        return bookMapper.selectById(bookID);
    }

    @Override
    public int updateBook(Book book) {
        if (book.getBookSum() < book.getBookLend()) {
            return 0;
        }
        return bookMapper.updateById(book);
    }

    @Override
    public int deleteBook(String bookID) {
        return bookMapper.deleteById(bookID);
    }

    @Override
    public int addBook(Book book) {
        return bookMapper.insert(book);
    }

    @Override
    public int returnBook(String bookID) {
        Book book = findById(bookID);
        //如果借出数量大于库存,已借数量小于等于0，返回不成功
//        if (book.getBookSum() < book.getBookLend() || book.getBookLend() < 1) {
//            return 0;
//        }
        book.setBookLend(book.getBookLend() - 1);
        return bookMapper.updateById(book);
    }

    @Override
    public int check(String bookID) {
        Book book = findById(bookID);
        if (book == null || book.getBookSum() <= book.getBookLend()) {
            return 0;
        }
        return 1;
    }
}

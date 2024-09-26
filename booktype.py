from enum import Enum


class BookType(Enum):
    ph = 1
    hs = 2
    li = 3
    hg = 4
    sc = 5

    @staticmethod
    def getString(book_type):
        if isinstance(book_type, str):
            if book_type == BookType.ph.name:
                return '哲学'
            if book_type == BookType.hs.name:
                return '人文社科类'
            if book_type == BookType.hg.name:
                return '历史地理'
            if book_type == BookType.li.name:
                return '文学艺术'
            if book_type == BookType.sc.name:
                return '自然应用科学'
            else:
                return 'error'
        else:
            if book_type == BookType.ph.value:
                return '哲学'
            if book_type == BookType.hs.value:
                return '人文社科类'
            if book_type == BookType.hg.value:
                return '历史地理'
            if book_type == BookType.li.value:
                return '文学艺术'
            if book_type == BookType.sc.value:
                return '自然应用科学'
            else:
                return 'error'

    @staticmethod
    def getValue(typename):
        if typename == 'ph' or typename == '哲学':
            return BookType.ph.value
        if typename == 'hs' or typename == '人文社科类':
            return BookType.hs.value
        if typename == 'hg' or typename == '历史地理':
            return BookType.hg.value
        if typename == 'li' or typename == '文学艺术':
            return BookType.li.value
        if typename == 'sc' or typename == '自然应用科学':
            return BookType.sc.value
        else:
            return 'error'


print(BookType.getString('ph'))
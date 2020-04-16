//
//  BooksInterfaceController.swift
//  TableWatchLesson WatchKit Extension
//
//  Created by Алексей Пархоменко on 14.04.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import WatchKit
import Foundation

class BooksInterfaceController: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!
    var map = [GenreType: [BookItem]]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        for book in BookItem.getBooks() {
            var arr = map[book.genre] ?? [BookItem]()
            arr.append(book)
            map[book.genre] = arr
        }
        
        for (genre, books) in map {
            add(withGenre: genre, books: books)
        }
    }
    
    func add(withGenre genre: GenreType, books: [BookItem]) {
        let rows = table.numberOfRows
        table.insertRows(at: NSIndexSet(index: rows) as IndexSet, withRowType: "headerRowid")

        let itemRows = NSIndexSet(indexesIn: NSRange(location: rows + 1, length: books.count))
        table.insertRows(at: itemRows as IndexSet, withRowType: "tableid")
        
        // конфигурация каждой ячейки
        for i in rows..<table.numberOfRows {
            let controller = table.rowController(at: i)
            
            if let controller = controller as? HeaderRowController {
                controller.image.setImageNamed(genre.rawValue.lowercased())
                
                controller.label.setText(genre.descriptionForWatch())
            } else if let controller = controller as? TableRowController {
                
                let book = books[i - rows - 1]
                controller.titleLabel.setText(book.name)
                controller.descriptionLabel.setText("Author: \(book.author)")
            }
        }
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {

        var pickedIndex = -1
        var pickedBook: BookItem?
        for (_, books) in map {
            pickedIndex += 1
            for book in books {
                pickedIndex += 1
                if rowIndex == pickedIndex {
                    pickedBook = book
                }
            }
        }
        
        return pickedBook
    }
}

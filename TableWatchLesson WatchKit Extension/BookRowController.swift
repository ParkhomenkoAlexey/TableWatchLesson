//
//  BookRowController.swift
//  TableWatchLesson WatchKit Extension
//
//  Created by Алексей Пархоменко on 16.04.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import WatchKit

class BookRowController: NSObject {
    
    var book: BookItem! {
      didSet {
        bookTitle.setText("\(book.name) \(book.author)")
      }
    }
    
    @IBOutlet weak var bookTitle: WKInterfaceLabel!
    

}

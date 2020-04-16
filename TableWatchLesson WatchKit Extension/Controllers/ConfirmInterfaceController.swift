//
//  ConfirmInterfaceController.swift
//  TableWatchLesson WatchKit Extension
//
//  Created by Алексей Пархоменко on 16.04.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var confirmationlabel: WKInterfaceLabel!
    
    var book: BookItem!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let book = context as? BookItem {
            self.book = book
            setTitle(book.name)
            confirmationlabel.setText("Вы уверены что хотите выбрать эту книгу?")
        }
    }
    
    @IBAction func bookSelected() {
        UserSettings.userBooks.append(book)
        popToRootController()
    }
    
    @IBAction func cancelSelected() {
        pop()
    }

}

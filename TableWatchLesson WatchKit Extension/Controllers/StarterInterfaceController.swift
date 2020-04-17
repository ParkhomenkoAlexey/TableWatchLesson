//
//  StarterInterfaceController.swift
//  TableWatchLesson WatchKit Extension
//
//  Created by Алексей Пархоменко on 16.04.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import WatchKit
import Foundation


class StarterInterfaceController: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!
    var selectedRow: Int! = nil
    
    override func willActivate() {
      super.willActivate()
      updateDisplay()
    }
    
    private func updateDisplay() {
        
        let pickedBooks = UserSettings.userBooks
        print(pickedBooks)
        table.setNumberOfRows(pickedBooks.count, withRowType: "myBookRow")
        for index in 0...(pickedBooks.count) {
            if let controller = table.rowController(at: index) as? MyBookRowController {
                let book = pickedBooks[index]
                controller.book = book
            }
        }
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        if let rowController = table.rowController(at: rowIndex) as? MyBookRowController {
          return rowController.book
        }
        return nil
    }
    
    @IBAction func deleteAll() {
        UserSettings.userBooks = []
        updateDisplay()
    }
}

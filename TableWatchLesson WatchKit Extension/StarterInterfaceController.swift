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
    
    override func willActivate() {
      super.willActivate()
      updateDisplay()
    }
    
    private func updateDisplay() {
        
        let pickedBooks = UserSettings.userBooks
        print(pickedBooks)
        table.setNumberOfRows(pickedBooks.count, withRowType: "BookRowType")
        for index in 0...(pickedBooks.count) {
            if let controller = table.rowController(at: index) as? BookRowController {
                let book = pickedBooks[index]
                controller.book = book
            }
        }
    }
        
//      if let purchasedMovieTickets = TicketOffice.sharedInstance.purchasedMovies() {
//        let numberOfMovies = purchasedMovieTickets.count
//        table.setNumberOfRows(numberOfMovies, withRowType: "MovieRowType")
//        for index in 0...(numberOfMovies-1) {
//          if let controller = table.rowController(at: index) as? MovieRowController {
//            let movie = purchasedMovieTickets[index]
//            controller.movie = movie
//          }
//        }
//      }
//    }

}

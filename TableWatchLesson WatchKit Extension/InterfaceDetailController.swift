//
//  InterfaceDetailController.swift
//  TableWatchLesson WatchKit Extension
//
//  Created by Алексей Пархоменко on 14.04.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit
import WatchKit

class InterfaceDetailController: WKInterfaceController {

    @IBOutlet weak var detailTable: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let model = context as? Model {
            let rowTypes: [String] = ["titleRowid"] + model.objects.map({ (_) in
                "objectRowid"
            })
            detailTable.setRowTypes(rowTypes)
            for i in 0..<detailTable.numberOfRows {
                let row = detailTable.rowController(at: i)
                if let titleRow = row as? TableTitleRow {
                    titleRow.myTitleLabel.setText(model.title)
                } else if let objectRow = row as? TableObjectRow {
                    objectRow.objectTitle.setText("\(i). " + model.objects[i - 1])
                }
            }
        }
    }
}

//
//  InterfaceController.swift
//  TableWatchLesson WatchKit Extension
//
//  Created by Алексей Пархоменко on 14.04.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import WatchKit
import Foundation

struct Model {
    var title: String
    var description: String
    var objects: [String]
    
    static func getData() -> [Model] {
        return [
            Model(title: "111", description: "111", objects: ["first1", "second1", "third1", "fouth1"]),
            Model(title: "222", description: "222", objects: ["first2", "second2", "third2", "fouth2"]),
            Model(title: "333", description: "333", objects: ["first3", "second3", "third3", "fouth3"]),
            Model(title: "444", description: "444", objects: ["first4", "second4", "third4", "fouth4"])
        ]
    }
}


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        table.setNumberOfRows(Model.getData().count, withRowType: "tableid")
        
        for (index, item) in Model.getData().enumerated() {
            let controller = table.rowController(at: index) as! TableRowController
            controller.titleLabel.setText(item.title)
            controller.descriptionLabel.setText(item.description)
        }
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        return Model.getData()[rowIndex]
    }

}

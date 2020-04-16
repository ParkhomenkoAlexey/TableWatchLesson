//
//  InterfaceController.swift
//  TableWatchLesson WatchKit Extension
//
//  Created by Алексей Пархоменко on 14.04.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import WatchKit
import Foundation

struct Section {
    var sectionName: String
    var models: [Model]
    
    static func getSections() -> [Section] {
        return [
            Section(sectionName: "fruits", models: [
                Model(title: "apple", description: "111", objects: ["first1", "second1"]),
                Model(title: "banana", description: "222", objects: ["first2", "second2", "third2", "fouth2"])
            ]),
            Section(sectionName: "vegetables", models: [
                Model(title: "carrot", description: "qqq", objects: ["firstq"]),
                Model(title: "potato", description: "www", objects: ["firstw", "secondw", "thirdw", "fouthw"]),
                Model(title: "cabbage", description: "eee", objects: ["firste", "seconde", "thirde", "fouthe"])
            ]),
            Section(sectionName: "321321", models: [
                Model(title: "car321321rot", description: "qqq", objects: ["firstq"]),
                Model(title: "pot32132ato", description: "www", objects: ["firstw", "secondw", "thirdw", "fouthw"]),
                Model(title: "cab3213bage", description: "eee", objects: ["firste", "seconde", "thirde", "fouthe"]),
                Model(title: "cucu3213mber", description: "rrr", objects: ["firstr", "secondr"])
            ])
        ]
    }
}

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
        
        for (_, section) in Section.getSections().enumerated() {
            add(withType: section.sectionName, models: section.models)
        }
    }
    
    func add(withType type: String, models: [Model]) {
      // 1
    let rows = table.numberOfRows
    // 2
    table.insertRows(at: NSIndexSet(index: rows) as IndexSet, withRowType: "headerRowid")
    // 3
    let itemRows = NSIndexSet(indexesIn: NSRange(location: rows + 1, length: models.count))
    table.insertRows(at: itemRows as IndexSet, withRowType: "tableid")
        
        // конфигурация каждой ячейки
    for i in rows..<table.numberOfRows {
//        print("i: \(i), rows: \(rows)")
        let controller = table.rowController(at: i)
        
        if let controller = controller as? HeaderRowController {
            controller.image.setImageNamed(type.lowercased())
            controller.label.setText(type)
        } else if let controller = controller as? TableRowController {
            
            let model = models[i - rows - 1]
//            print("i: \(i), models[i - rows - 1]: \(i - rows - 1) title: \(model.title)")
            controller.titleLabel.setText(model.title)
            controller.descriptionLabel.setText("\(model.objects.count) ingredients")
        }
    }
        
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {

        var pickedIndex = 0
        var pickedsectionIndex = 0
        var pickedModelIndex = 0
        for (sectionIndex, section) in Section.getSections().enumerated() {
            if sectionIndex != 0 {
                pickedIndex += 1
            }
            for (modelIndex, _) in section.models.enumerated() {
                pickedIndex += 1
                if rowIndex == pickedIndex {
                    pickedModelIndex = modelIndex
                    pickedsectionIndex = sectionIndex
                }
            }
        }
        return Section.getSections()[pickedsectionIndex].models[pickedModelIndex]
    }

}

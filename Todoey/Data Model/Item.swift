//
//  Item.swift
//  Todoey
//
//  Created by Abdualziz Aljuaid on 01/08/2020.
//  Copyright © 2020 Abdualziz Aljuaid. All rights reserved.
//

import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}

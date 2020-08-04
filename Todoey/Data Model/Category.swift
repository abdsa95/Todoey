//
//  Category.swift
//  Todoey
//
//  Created by Abdualziz Aljuaid on 01/08/2020.
//  Copyright © 2020 Abdualziz Aljuaid. All rights reserved.
//

import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}

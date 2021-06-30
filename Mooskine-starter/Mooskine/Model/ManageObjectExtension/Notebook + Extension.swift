//
//  Notebook + Extension.swift
//  Mooskine
//
//  Created by YoYo on 2021-06-30.
//  Copyright © 2021 Udacity. All rights reserved.
//

import Foundation
import CoreData
extension Notebook{
    public override func awakeFromInsert(){
        super.awakeFromInsert()
        creationDate = Date()
    }
}

//
//  PasteboardDataSourceProtocol.swift
//  clipper
//
//  Created by Wayne Irwin on 16/6/19.
//  Copyright © 2019 Wayne Irwin. All rights reserved.
//

import Foundation


protocol PasteboardDataSourceProtocol{
    func hasNewData() -> Bool
    func data() -> [String]
}



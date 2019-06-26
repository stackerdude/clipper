//
//  main.swift
//  clipper
//
//  Created by Wayne Irwin on 26/6/19.
//  Copyright © 2019 Wayne Irwin. All rights reserved.
//

import Foundation
import Cocoa

let delegate = AppDelegate() //alloc main app's delegate class
NSApplication.shared.delegate = delegate //set as app's delegate

// Old versions:
// NSApplicationMain(C_ARGC, C_ARGV)
NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)

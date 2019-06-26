//
//  main.swift
//  clipper
//
//  Created by Wayne Irwin on 26/6/19.
//  Copyright © 2019 Wayne Irwin. All rights reserved.
//
import Foundation
import Cocoa

//Check in invoked from the AppDelegate class
let isRunningTests = NSClassFromString("XCTestCase") != nil
let appDelegateClass = isRunningTests ? FakeAppDelegate.self() : AppDelegate.self()

//let delegate = AppDelegate.self() //alloc main app's delegate class
NSApplication.shared.delegate = appDelegateClass as? NSApplicationDelegate //set as app's delegate

// Old versions:
// NSApplicationMain(C_ARGC, C_ARGV)
NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)



//
//  AsyncFunctionality.swift
//  SnapInterview
//
//  Created by Scott Lydon on 6/12/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import Foundation

var checkPoints: [String] = []

func task6() {
    // main thread
    // updating some elements in UI
    checkPoints.append("Enter 1: \(Date())")
    subtask6()
    // Some work
    checkPoints.append("Exit 1: \(Date())")
    for checkPoint in checkPoints {
        // Some work
        print("\(checkPoint)")
    }
}

func subtask6() {
    checkPoints.append("Enter 2: \(Date())")
    // Formatting some contacts.
    // Some work
    // @synchronized(self)
    DispatchQueue.main.sync {
        // some work
        checkPoints.append("Exit 2: \(Date())")
    }
}
/// When we are using DispatchQueue.main.async {}

/// called from main thread.
/*
If the implementation of async ensueues the task
"Enter 1:
"Enter 2
"Exit 1:
*/

/// called from the main thread
/*
If the implementation of async inserts after the current running task
"Enter 1:
"Enter 2
"Exit 2
"Exit 1
*/


/// called from utility thread
/*
"Enter 1
"Enter 2
"Exit 2:
"Exit 1
*/

//-----------------------------------------------

/// DispatchQueue.main.sync
/* main thread start
enter 1
enter 2
exit 1
*/

/* utility start
enter 1
enter 2
exit 2
exit 1

*/


//------------------------------------------------

/// When we were talking about qos: background

/// This is called from a main thread:
/*
"Enter 1:
"Enter 2
"Exit 1:

*/

/// If this is called on a qos .utilty
/*
"Enter 1:
"Enter 2
"Exit 2:
"Exit 1
*/

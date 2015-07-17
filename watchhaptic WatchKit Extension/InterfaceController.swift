//
//  InterfaceController.swift
//  watchhaptic WatchKit Extension
//
//  Created by Lars Kinnunen on 17/07/15.
//  Copyright © 2015 Unetti Ltd. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    
//    enum WKHapticType : Int {
//        
//        case Notification
//        case DirectionUp
//        case DirectionDown
//        case Success
//        case Failure
//        case Retry
//        case Start
//        case Stop
//        case Click
//    }
    
    let haptic = ["Notification","DirectionUp","DirectionDown","Success", "Failure", "Retry", "Start", "Stop", "Click"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        // Configure interface objects here.
        self.table.setNumberOfRows(self.haptic.count, withRowType: "HapticRow")
        
        for index in 0..<self.haptic.count {
            let row: AnyObject? = self.table.rowControllerAtIndex(index)
            if row is HapticRow {
                let theRow = row as! HapticRow
                theRow.label.setText(self.haptic[index])
            }
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        print(self.haptic[rowIndex])
        
        switch rowIndex {
            case 0: WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Notification)
            case 1: WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.DirectionUp)
            case 2: WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.DirectionDown)
            case 3: WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Success)
            case 4: WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Failure)
            case 5: WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Retry)
            case 6: WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Start)
            case 7: WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Stop)
            case 8: WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Click)
            default: WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Click)
        }
    }

}

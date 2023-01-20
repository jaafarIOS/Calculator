//
//  Device.swift
//  Calculator
//
//  Created by Consultant on 1/19/23.
//

import UIKit

struct Device {
    static var isIpad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}

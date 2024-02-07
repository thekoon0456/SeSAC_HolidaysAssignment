//
//  Then+.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import Foundation

protocol Then {}
extension NSObject: Then {}

extension Then where Self: AnyObject {
    func then(_ action: (Self) -> Void) -> Self {
        action(self)
        return self
    }
}

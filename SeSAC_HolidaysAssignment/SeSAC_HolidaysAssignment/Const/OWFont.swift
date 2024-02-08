//
//  Font.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import UIKit

enum OWFont {
    case mainTemp
    case large(isBold: Bool)
    case regular
    case small
    
    var label: OWLabel {
        switch self {
        case .mainTemp:
            OWLabel(size: 80)
        case .large(let isBold):
            OWLabel(size: 30, isBold: isBold)
        case .regular:
            OWLabel(size: 20)
        case .small:
            OWLabel(size: 15)
        }
    }
}

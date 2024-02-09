//
//  Font.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import UIKit

enum OWFont {
    case mainTemp
    case large(weight: UIFont.Weight, alignment: NSTextAlignment)
    case regular
    case small
    case little
    
    var label: OWLabel {
        switch self {
        case .mainTemp:
            OWLabel(size: 80, weight: .thin)
        case .large(let weight, let alignment):
            OWLabel(size: 30, weight: weight, alignment: alignment)
        case .regular:
            OWLabel(size: 25)
        case .small:
            OWLabel(size: 20)
        case .little:
            OWLabel(size: 15)
        }
    }
}

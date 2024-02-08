//
//  Font.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import UIKit

enum Font {
    case mainTemp
    case large
    case regular
    case small
    
    var size: UIFont {
        switch self {
        case .mainTemp:
            UIFont.systemFont(ofSize: 30, weight: .medium)
        case .large:
            UIFont.systemFont(ofSize: 20, weight: .medium)
        case .regular:
            UIFont.systemFont(ofSize: 16, weight: .medium)
        case .small:
            UIFont.systemFont(ofSize: 14, weight: .medium)
        }
    }
    
}

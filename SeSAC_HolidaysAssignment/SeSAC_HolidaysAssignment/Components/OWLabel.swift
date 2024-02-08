//
//  OWLabel.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import UIKit

final class OWLabel: UILabel {
    
    init(size: CGFloat,
         weight: UIFont.Weight = .regular,
         color: UIColor = .white,
         alignment: NSTextAlignment = .center) {
        super.init(frame: .zero)
        font = .systemFont(ofSize: size, weight: weight)
        textColor = color
        textAlignment = alignment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

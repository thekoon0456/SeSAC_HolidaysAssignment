//
//  BaseCollectionViewCell.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return self.description()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() { }
    func configureLayout() { }
    func configureView() { }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

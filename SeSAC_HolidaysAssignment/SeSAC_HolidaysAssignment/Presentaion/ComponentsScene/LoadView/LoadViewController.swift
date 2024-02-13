//
//  LoadViewController.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/9/24.
//

import UIKit

final class LoadViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let backgroundView = UIImageView().then {
        $0.image = OWConst.BGImage.sunny.image
        $0.contentMode = .scaleAspectFill
        $0.alpha = 0.4
    }
    
    override func configureHierarchy() {
        view.addSubview(backgroundView)
    }
    
    override func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func configureView() {
        view.backgroundColor = .black
    }
}

//
//  ToastViewController.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import UIKit

final class ToastViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let ment = OWLabel(size: 15).then {
        $0.backgroundColor = .black
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 3
        $0.clipsToBounds = true
    }
    
    // MARK: - Helpers
    
    override func configureHierarchy() {
        view.addSubview(ment)
    }
    
    override func configureLayout() {
        ment.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
        }
    }
    
    override func configureView() {
        view.backgroundColor = .clear
        ment.text = "이 도시가 선택되었습니다"
    }
}

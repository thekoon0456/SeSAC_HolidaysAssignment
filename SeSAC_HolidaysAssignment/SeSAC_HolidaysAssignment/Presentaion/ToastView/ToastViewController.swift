//
//  ToastViewController.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import UIKit

final class ToastViewController: BaseViewController {
    
    // MARK: - Properties
    
    let cityName: String
    
    private let ment = OWPaddingLabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .white
        $0.padding = .init(top: 5, left: 10, bottom: 5, right: 10)
        $0.backgroundColor = .black
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
    
    // MARK: - Helpers
    
    init(cityName: String) {
        self.cityName = cityName
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Helpers
    
    override func configureHierarchy() {
        view.addSubview(ment)
    }
    
    override func configureLayout() {
        ment.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
        }
    }
    
    override func configureView() {
        view.backgroundColor = .clear
        ment.text = cityName + " 가 선택되었습니다"
    }
}

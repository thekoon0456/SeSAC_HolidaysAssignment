//
//  OWHeaderView.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/9/24.
//

import UIKit

final class OWHeaderView: BaseView {
    
    // MARK: - Properties
    
    private let bgView = UIView().then {
        $0.backgroundColor = .black
        $0.alpha = 0.1
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
    }
    
    private let icon = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private let title = OWFont.little.label
    
    let divider = UIView().then {
        $0.backgroundColor = .systemGray
    }

    // MARK: - Lifecycles
    
    convenience init(type: HeaderType) {
        self.init()
        icon.image = type.result.image?.withTintColor(.systemGray,
                                                      renderingMode: .alwaysOriginal)
        title.text = type.result.title
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    
    override func configureHierarchy() {
        addSubviews(bgView, icon, title, divider)
    }
    
    override func configureLayout() {
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        icon.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(12)
            make.size.equalTo(20)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalTo(icon.snp.trailing).offset(8)
            make.height.equalTo(20)
        }
        
        divider.snp.makeConstraints { make in
            make.top.equalTo(icon.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-24)
            make.height.equalTo(1)
        }
    }
    
    override func configureView() {

    }
}

extension OWHeaderView {
    
    struct HeaderContent {
        let image: UIImage?
        let title: String
    }
    
    enum HeaderType: CaseIterable {
        case threeHour
        case fiveDays
        case location
        
        var result: HeaderContent {
            switch self {
            case .threeHour:
                HeaderContent(image: UIImage(systemName: "calendar"),
                              title: "3시간 간격의 일기예보")
            case .fiveDays:
                HeaderContent(image: UIImage(systemName: "calendar"),
                              title: "5일 간의 일기예보")
            case .location:
                HeaderContent(image: UIImage(systemName: "thermometer.medium"),
                              title: "위치")
            }
        }
    }
}

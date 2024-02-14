//
//  Coordinator+.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/13/24.
//

import UIKit

extension Coordinator {
    
    func showAlert(title: String,
                   message: String,
                   primaryButtonTitle: String,
                   cancleButtonTitle: String = "취소",
                   primaryAction: @escaping (UIAlertAction) -> Void,
                   cancleAction: @escaping (UIAlertAction) -> Void) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.view.tintColor = .white
        
        let defaultButton = UIAlertAction(title: primaryButtonTitle, style: .default, handler: primaryAction)
        let cancleButton = UIAlertAction(title: cancleButtonTitle, style: .destructive, handler: cancleAction)
        
        alert.addAction(cancleButton)
        alert.addAction(defaultButton)
        
        navigationController?.present(alert, animated: true)
    }
}

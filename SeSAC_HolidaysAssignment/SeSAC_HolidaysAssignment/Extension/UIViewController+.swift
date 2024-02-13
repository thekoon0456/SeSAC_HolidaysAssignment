//
//  UIViewController+.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/13/24.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String,
                   message: String,
                   primaryButtonTitle: String,
                   cancleButtonTitle: String = "취소",
                   primaryAction: @escaping () -> Void,
                   cancleAction: @escaping () -> Void) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.view.tintColor = .tintColor
        
        let defaultButton = UIAlertAction(title: primaryButtonTitle, style: .default) { _ in
            primaryAction()
        }
        
        let cancleButton = UIAlertAction(title: cancleButtonTitle, style: .destructive) {  _ in
            cancleAction()
        }
        
        alert.addAction(cancleButton)
        alert.addAction(defaultButton)
        
        present(alert, animated: true)
    }
}

//
//  ViewControllerProtocol.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/11/24.
//

import Foundation

protocol VMViewController {
    associatedtype T = ViewModel
    
    var viewModel: T { get }
}

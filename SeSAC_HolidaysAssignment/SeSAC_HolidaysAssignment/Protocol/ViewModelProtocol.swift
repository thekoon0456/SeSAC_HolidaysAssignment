//
//  ViewModelCoordinator.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import Foundation

protocol ViewModel: AnyObject {
    associatedtype T: Coordinator
    
    var coordinator: T? { get }
    
    
}

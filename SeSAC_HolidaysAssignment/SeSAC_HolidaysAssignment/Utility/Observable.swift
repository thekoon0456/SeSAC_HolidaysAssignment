//
//  Observable.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import Foundation

final class Observable<T> {
    
    typealias Listener = (T) -> Void
    
    private var listener: Listener?
    
    private var value: T {
        didSet {
            listener?(value)
        }
    }
    
    var currentValue: T {
        value
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    func onNext(_ value: T) {
        self.value = value
    }
}



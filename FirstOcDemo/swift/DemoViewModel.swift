//
//  DemoViewModel.swift
//  FirstOcDemo
//
//  Created by zj015 on 2026/9/13.
//

import Foundation
import UIKit
import Combine


@objc protocol DemoViewModelDelegate : AnyObject {
    func viewModel(_ vm: DemoViewModel, didSubmitText text:String)
}


@objc final class DemoViewModel: NSObject, ObservableObject {
    
    @objc weak var delegate: DemoViewModelDelegate?
    
    @Published var text: String = ""
    @Published var isLoading: Bool = false
    
    
    @objc func submit() {
        isLoading = true
        delegate?.viewModel(self, didSubmitText: text)
    }
}

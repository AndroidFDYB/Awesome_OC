//
//  SwiftUIBridge.swift
//  FirstOcDemo
//
//  Created by zj015 on 2026/9/13.
//

import Foundation
import UIKit
import SwiftUI


@objc final class SwiftUIBridge : NSObject {
    @MainActor @objc static func makeViewController() -> UIViewController {
        let vc = UIHostingController(rootView: SkSFUIView())
        return vc
    }

    
//    @MainActor @objc static func makeViewControllerV2(viewModel: DemoViewModel) -> UIViewController{
//        UIHostingController(rootView: DemoView(viewModel:viewModel));
//    }
    
    @MainActor @objc static func makeViewControllerV3(onSumbmit: @escaping (String)->Void) -> UIViewController {
        UIHostingController(rootView: DemoView(onSubmit:onSumbmit))
    }
}

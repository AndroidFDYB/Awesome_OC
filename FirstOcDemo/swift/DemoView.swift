//
//  DemoView.swift
//  FirstOcDemo
//
//  Created by zj015 on 2026/9/13.
//

import SwiftUI

struct DemoView: View {
    @ObservedObject var viewModel: DemoViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            TextField("please input", text: $viewModel.text)
                .textFieldStyle(.roundedBorder)
            Button("submit") {
                viewModel.submit()
            }
        }.padding()
    }
}

//#Preview {
//    DemoView()
//}

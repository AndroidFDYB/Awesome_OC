//
//  SkSFUIView.swift
//  FirstOcDemo
//
//  Created by zj015 on 2026/9/13.
//

import SwiftUI

struct SkSFUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button("CallOC") {
            let vc = SkCustomControllerViewController()
            vc.printLog(fromSw: "CallOC")
        }
    }
}

#Preview {
    SkSFUIView()
}

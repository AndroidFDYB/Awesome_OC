//
//  DemoView.swift
//  FirstOcDemo
//
//  Created by zj015 on 2026/9/13.
//

import SwiftUI

struct DemoView: View {
    
    let onSubmit: (String)->Void
    
    @State private var text:String = ""
    
    var body: some View {
        VStack(spacing: 12) {
            TextField("please input", text:$text)
                .textFieldStyle(.roundedBorder)
            Button("submit") {
                onSubmit(text)
            }
        }.padding()
    }
}

//#Preview {
//    DemoView()
//}

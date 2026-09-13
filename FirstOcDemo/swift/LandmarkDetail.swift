//
//  LandmarkDetail.swift
//  FirstOcDemo
//
//  Created by zj015 on 2026/9/13.
//

import SwiftUI

struct LandmarkDetail: View {
    var body: some View {
        
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 350)
            
            
            Image("tiananmine")
                .clipShape(Circle())
                .overlay{
                    Circle()
                        .stroke(Color.red,lineWidth: 4)
                     
                }
                .shadow(radius: 10)
                .offset(x:0,y:-130)
                .padding(.bottom,-130)
                
            VStack(alignment: .leading,spacing: 8) {
                Text("dongfangming")
                    .font(.title)
                HStack {
                    Text("shanghai")
                    Spacer()
                    Text("shanghaishi")
                }
            }
            .padding()
            
            Spacer()
        }
        .navigationBarTitle(Text("tianamen"),displayMode: .inline)
        
    }
}
//
//#Preview {
//    NavigationView {
//        LandmarkDetail()
//    }
//    
//}

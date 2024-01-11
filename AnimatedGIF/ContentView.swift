//
//  ContentView.swift
//  AnimatedGIF
//
//  Created by Doris Wen on 2024/1/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            List {
                GIFImage("delete")
                    .frame(width: 300, height: 200, alignment: .center)
                GIFImage("simp")
                    .frame(width: 300, height: 200, alignment: .center)
            }
            .listStyle(.automatic)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

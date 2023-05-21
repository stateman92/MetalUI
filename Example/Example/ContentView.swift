//
//  ContentView.swift
//  Example
//
//  Created by Kristóf Kálai on 2023. 05. 21..
//

import MetalKit
import MetalUI
import SwiftUI

struct ContentView: View {
    var body: some View {
        MetalView {
            CustomMetalView()
        }
        .ignoresSafeArea()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

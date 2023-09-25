//
//  ContentView.swift
//  MyWatchApp Watch App
//
//  Created by Tomas Kafka on 25.09.2023.
//

import SwiftUI
import MyKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
					Text("Hello, \(MyEnum.one.str)!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

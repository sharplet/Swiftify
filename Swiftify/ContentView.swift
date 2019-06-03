//
//  ContentView.swift
//  Swiftify
//
//  Created by Adam Sharp on 3/6/19.
//  Copyright © 2019 thoughtbot. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

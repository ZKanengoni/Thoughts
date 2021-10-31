//
//  LazyView.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/31.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body:  Content {
        build()
    }
}


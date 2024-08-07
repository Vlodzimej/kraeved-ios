//
//  GeoObjectDetailsComments.swift
//  kraeved
//
//  Created by Владимир Амелькин on 05.02.2024.
//

import SwiftUI

//MARK: - GeoObjectDetailsComments
struct GeoObjectDetailsComments: View {
    var body: some View {
        EmptyPlacheholderView(image: Image(systemName: "ellipsis.message"),
                              title: "comments.empty")
    }
}

#Preview {
    GeoObjectDetailsComments()
}

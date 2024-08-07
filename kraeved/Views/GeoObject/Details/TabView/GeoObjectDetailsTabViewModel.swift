//
//  GeoObjectDetailsTabViewModel.swift
//  kraeved
//
//  Created by Владимир Амелькин on 08.02.2024.
//

import SwiftUI

//MARK: - GeoObjectDetailsTabView
extension GeoObjectDetailsTabView {
    
    final class ViewModel: ObservableObject {
        
        @Published var items: [KraevedTabItem] = {
            [.description, .gallery, .comments, .edit].enumerated()
                .map { (index, type) in.init(index: index, type: type, imageName: type.imageName)}
        }()
    }
}

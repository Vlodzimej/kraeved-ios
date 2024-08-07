//
//  AttractionsViewModel.swift
//  kraeved
//
//  Created by Владимир Амелькин on 03.10.2023.
//

import SwiftUI

extension AttractionsFeedView {
    
    //MARK: - ViewModel
    final class ViewModel: BaseViewModel {
                
        //MARK: Properties
        @Published private(set) var attractions: [GeoObjectBrief]?

        //MARK: Public Methods
        func getAttractions() async {
            guard !isLoading else { return }
            isLoading = true
            
            defer {
                isLoading = false
            }
            
            let result = await kraevedAPI.getGeoObjects()
            if case let .success(geoObject) = result {
                attractions = geoObject
            }
        }
    }
}

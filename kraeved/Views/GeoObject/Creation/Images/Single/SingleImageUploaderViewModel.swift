//
//  SingleImageUploaderViewModel.swift
//  kraeved
//
//  Created by Владимир Амелькин on 16.05.2024.
//

import SwiftUI
import PhotosUI

extension SingleImageUploaderView {
    
    final class ViewModel: BaseViewModel {

        @Published private(set) var imageState: UploadImageState = .empty
        @Published var image: UIImage?
        
        @Published var imageSelection: PhotosPickerItem? {
            didSet {
                if let imageSelection {
                    let progress = loadTransferable(from: imageSelection)
                    imageState = .loading(progress)
                } else {
                    imageState = .empty
                }
            }
        }
        
        private func loadTransferable(from imageSelection: PhotosPickerItem) -> Progress {
            return imageSelection.loadTransferable(type: Data.self) { result in
                DispatchQueue.main.async {
                    guard imageSelection == self.imageSelection else { return }
                    switch result {
                        case let .success(data?):
                            guard let uiImage = UIImage(data: data) else {
                                self.imageState = .empty
                                return
                            }
                            self.image = uiImage
                            self.imageState = .success(Image(uiImage: uiImage))
                        case .success(.none):
                            self.imageState = .empty
                        case let .failure(error):
                            self.imageState = .failure(error)
                    }
                }
            }
        }
    }
}
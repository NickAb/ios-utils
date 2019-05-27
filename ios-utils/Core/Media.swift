//
//  Copyright © 2019 Nikolai Abalov and contributors
//
//  This source code is licensed under the MIT license found in the
//  LICENSE file in the root directory of this source tree.
//

import Foundation
import Photos

struct MediaAsset: Codable {
    let id: String
    let type: String
    
    init(asset: PHAsset) {
        id = asset.localIdentifier
        type = MediaAsset.mediaType(type: asset.mediaType)
    }
    
    private static func mediaType(type: PHAssetMediaType) -> String {
        switch type {
            case .audio:
                return "audio"
            case .image:
                return "image"
            case .unknown:
                return "unknown"
            case .video:
                return "video"
            default:
                return "\(type)"
            }
    }
}

final class Media {
    
    func list() -> [MediaAsset] {
        let fetchedAssets = PHAsset.fetchAssets(with: nil)
        
        var mediaAssets = [MediaAsset]()
        
        fetchedAssets.enumerateObjects { (asset, _idx, _) in
            mediaAssets.append(MediaAsset(asset: asset))
        }
        
        return mediaAssets
    }
    
    func delete() throws -> Void {
        let fetchedAssets = PHAsset.fetchAssets(with: nil)
        
        try PHPhotoLibrary.shared().performChangesAndWait {
            PHAssetChangeRequest.deleteAssets(fetchedAssets)
        }
    }
}

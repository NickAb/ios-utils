//
//  Copyright © 2019 Nikolai Abalov and contributors
//
//  This source code is licensed under the MIT license found in the
//  LICENSE file in the root directory of this source tree.
//  

import Foundation
import UIKit

struct PasteboardItem: Codable {
    let type: String
    let value: String
}

class Pasteboard {
    func list() -> [PasteboardItem] {
        var items = [PasteboardItem]()
        
        let pasteboard = UIPasteboard.general
        
        for string in pasteboard.strings ?? [] {
            items.append(PasteboardItem(type: "string", value: string))
        }

        for url in pasteboard.urls ?? [] {
            items.append(PasteboardItem(type: "url", value: url.absoluteString))
        }

        return items
    }
    
    func delete() -> Void {
        UIPasteboard.general.items = []
    }
}

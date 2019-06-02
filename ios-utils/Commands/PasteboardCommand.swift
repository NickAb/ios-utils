//
//  Copyright © 2019 Nikolai Abalov and contributors
//
//  This source code is licensed under the MIT license found in the
//  LICENSE file in the root directory of this source tree.
//

import Foundation

final class ListPasteboardCommand: Command {
    var command: String = "list"
    
    var shortDescription: String = "List string and url pasteboard items"
    
    func run(with arguments: [String]) throws -> [Encodable] {
        return Pasteboard().list()
    }
}

final class DeletePasteboardCommand: Command {
    var command: String = "delete"
    
    var shortDescription: String = "Clear pasteboard"
    
    func run(with arguments: [String]) throws -> [Encodable] {
        Pasteboard().delete()
        
        return []
    }
}

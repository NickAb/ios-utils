//
//  Copyright © 2019 Nikolai Abalov and contributors
//
//  This source code is licensed under the MIT license found in the
//  LICENSE file in the root directory of this source tree.
//

import Foundation

final class DeleteMediaCommand: Command {
    var command: String = "delete"
    
    var shortDescription: String = "Delete all media assets"
    
    func run(with arguments: [String]) throws -> [Encodable] {
        try Media().delete()
        
        return []
    }
}

final class ListMediaCommand: Command {
    var command: String = "list"
    
    var shortDescription: String = "List media assets"
    
    func run(with arguments: [String]) throws -> [Encodable] {
        return Media().list()
    }
}

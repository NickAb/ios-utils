//
//  Copyright © 2019 Nikolai Abalov and contributors
//
//  This source code is licensed under the MIT license found in the
//  LICENSE file in the root directory of this source tree.
//

import Foundation

protocol Command {
    var command: String { get }
    var shortDescription: String { get }
    
    func run(with arguments: [String]) throws -> [Encodable]
}

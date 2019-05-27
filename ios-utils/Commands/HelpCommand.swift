//
//  Copyright © 2019 Nikolai Abalov and contributors
//
//  This source code is licensed under the MIT license found in the
//  LICENSE file in the root directory of this source tree.
//  

import Foundation

class HelpCommand: Command {
    var command: String = "help"
    
    var shortDescription: String = "Print usage"
    
    func run(with arguments: [String]) throws -> [Encodable] {
        throw(CliError.usage)
    }
}

//
//  Copyright © 2019 Nikolai Abalov and contributors
//
//  This source code is licensed under the MIT license found in the
//  LICENSE file in the root directory of this source tree.
//  

import Foundation

public enum CliError: Error {
    case usage
    case parse(String)
    
    public var description: String {
        switch self {
        case .usage:
            return "Usage"
        case .parse(let string):
            return "Could not parse arguments: \(string)"
        }
    }
}

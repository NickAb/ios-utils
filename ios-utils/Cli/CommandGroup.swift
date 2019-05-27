//
//  Copyright © 2019 Nikolai Abalov and contributors
//
//  This source code is licensed under the MIT license found in the
//  LICENSE file in the root directory of this source tree.
//

import Foundation

final class CommandGroup: Command {
    var command: String
    var shortDescription: String
    private(set) var subCommands: [Command]
    
    init(command: String, shortDescription: String, subCommands: [Command]) {
        self.command = command
        self.shortDescription = shortDescription
        
        self.subCommands = subCommands
    }
    
    func run(with arguments: [String]) throws -> [Encodable] {
        guard let action = arguments.first else {
            throw CliError.parse("Subcommand required")
        }
        guard let command = self.subCommands.first(where: { $0.command == action }) else {
            throw CliError.parse("Unknown subcommand")
        }
        
        return try command.run(with: Array(arguments.dropFirst()))
    }
}

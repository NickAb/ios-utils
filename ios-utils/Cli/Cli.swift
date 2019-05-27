//
//  Copyright © 2019 Nikolai Abalov and contributors
//
//  This source code is licensed under the MIT license found in the
//  LICENSE file in the root directory of this source tree.
//

import Foundation

extension Encodable {
    func toJSONData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}

final class Cli {
    let commands = CommandGroup(command: "", shortDescription: "", subCommands:
        [
            CommandGroup(command: "media", shortDescription: "", subCommands:
                [
                    ListMediaCommand(),
                    DeleteMediaCommand(),
                ]
            ),
            HelpCommand()
        ]
    )
    
    func run(args: [String]) throws -> Void {
        do {
            let results = try commands.run(with: args)
            
            for result in results {
                let data = result.toJSONData()
                let json = String(data: data ?? Data(), encoding: .utf8)
            
                print(json!)
            }

            exit(0)
        }
        catch let error as CliError {
            switch error {
            case .usage:
                printUsage()
                exit(0)
            default:
                print(error.description, "\n")
                printUsage()
                exit(1)
            }
        }
        catch let error {
            print(error.localizedDescription)
            exit(1)
        }
    }
    
    private func printCommandUsage(command: Command, indentation: Int) {
        let indent = String(repeating: " ", count: indentation)
        let cmd = (command is CommandGroup) ? "\(command.command) <subcommand>" : command.command
        let action = "\(indent)\(cmd)".padding(toLength: 24, withPad: " ", startingAt: 0)
        
        print("\(action) \(command.shortDescription)")
        
        if (command is CommandGroup) {
            for subCommand in (command as! CommandGroup).subCommands {
                printCommandUsage(command: subCommand, indentation: indentation + command.command.count + 1)
            }
        } else {
            
        }
    }
    
    func printUsage() -> Void {
        print("""
        Usage: xcrun simctl spawn booted <subcommand> ...
        
        Subcommands:
        """)
        
        for command in commands.subCommands {
            printCommandUsage(command: command, indentation: 4)
        }
    }
}

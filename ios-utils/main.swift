//
//  Copyright © 2019 Nikolai Abalov and contributors
//
//  This source code is licensed under the MIT license found in the
//  LICENSE file in the root directory of this source tree.
//

import Foundation

let cli = Cli()

try cli.run(args: Array(ProcessInfo.processInfo.arguments.dropFirst()))

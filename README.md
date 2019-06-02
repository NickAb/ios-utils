# ios-utils

Command-line utils for iOS simulators. Use in automated tests to list or delete media assets from a simulator.


## Quickstart

1. Clone the repository
    ```basg
    git clone https://github.com/NickAb/ios-utils.git
    cd ios-utils
    ```
2. Build
    ```bash
    xcodebuild build -sdk iphonesimulator -scheme ios-utils -derivedDataPath ./build
    ```
3. Launch on a booted simulator
    ```bash
    xcrun simctl spawn booted build/Build/Products/Debug-iphonesimulator/ios-utils.app/ios-utils help
    ```


## Usage

```
Usage: xcrun simctl spawn booted <subcommand> ...

Subcommands:
    media <subcommand>         
        list                   List media assets
        delete                 Delete all media assets
    help                       Print usage
```

## License

[`ios-utils` is MIT-licensed](LICENSE).

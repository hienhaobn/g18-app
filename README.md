# G18 App

# Flutter Bloc - Clean Architecture

Flutter project using clean architecture and bloc pattern.

![Architecture](images/project_architecture.png?raw=true)


## Getting Started

### Requirements

- Dart: 3.6.0
- Flutter SDK: 3.27.1
- Melos: 6.2.0
- CocoaPods: 1.14.3

### Install

- WARN: If you already installed `melos` and `lefthook`, you could omit this step.

- Install melos:
    - Run `dart pub global activate melos 6.2.0`

- Install lefthook (optional):
    - Run `gem install lefthook`

- Export paths:
    - Add to `.zshrc` or `.bashrc` file
```    
export PATH="$PATH:<path to flutter>/flutter/bin"
export PATH="$PATH:<path to flutter>/flutter/bin/cache/dart-sdk/bin"
export PATH="$PATH:~/.pub-cache/bin"
export PATH="$PATH:~/.gem/gems/lefthook-1.10.0/bin"
```
    - Save file `.zshrc`
    - Run `source ~/.zshrc`

### Config and run app

- cd to root folder of project
- Run `make gen_env`
- Run `make sync`
- Run `lefthook install` (optional)
- Run & Enjoy!

## License

MIT

In this repo, I would like to have a simple `MyKit3` framework with shared code, that is used in

- iOS app
- its widget extension
- watchOS app
- and its widget extension

Ideally, I want this framework to be a mergeable dynamic library (= `Build mergeable library = YES` and `Mach-O type = Dynamic library`), and other targets to have `Create merged binary` to `Automatic`.

So far this is surprisingly difficult in Xcode 15 RTM, as I always get an error `No such module 'MyKit3'` at `/MyWatchWidgets/MyWatchWidgets.swift:10:8`, and no amount of wrangling with framework search paths seems to fix this
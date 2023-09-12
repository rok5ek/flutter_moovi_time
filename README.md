# MooviTime

An open source movie centered mobile app made with Flutter.

## Clean Architecture

Defined as 3 layers, from outer to the inner one

- Presentation (ui, bloc)
- Domain (has no access to <data> layer, usecases, mapped objects from <data> layer, repository
  interfaces)
- Data (implements domain's interfaces, mappers, network responses)

Read more about Clean
Architecture [here](https://medium.com/ruangguru/an-introduction-to-flutter-clean-architecture-ae00154001b0)
and [here](https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47)

## Build Android apk

```
flutter build apk
```

## Build iOS ipa

```
flutter build ipa
```

## How to build the app before first run?

    1. Install all packages/libraries `flutter packages pub get`
    2. Build generated models `flutter pub run build_runner build --delete-conflicting-outputs`
    3. Click play

## Flutter cmd helper methods

Clean built models
```
flutter pub run build_runner clean
```

Run build runner
```
flutter pub run build_runner build --delete-conflicting-outputs
```

Analyze dependencies to find which ones can be upgraded
```
flutter pub outdated
```

Upgrade all dependencies
```
flutter pub upgrade --major-versions
```

Flutter clean

```
flutter clean
```

Flutter get packages
```
flutter packages pub get
```

## API

The base url is a movie database api https://www.themoviedb.org.

### Features

- Movies (Now playing, Popular, Top rated, Coming soon, Genres)
- TvShow (Airing today, On the air, Popular, Top rated)
- People (Popular)
- Search Movies, TV Shows, and People
- Account (Favorites, Watchlists, Lists)

## Google Play Store

MooviTime is now available on the [Google Play Store](#TODO).

## Cloning

Clone the GitHub repository and open the project in `Android Studio` or `Visual Studio Code`.

```
$ https://github.com/rok5ek/flutter_moovi_time.git
```

## License

MooviTime is licensed via [Apache License v2.0](LICENSE).

## Author

Rok Petek, https://www.linkedin.com/in/rok-petek-4673b459/


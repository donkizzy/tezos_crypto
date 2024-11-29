# Tezos Crypto

This project is a Flutter application that displays Bitcoin transaction details. It uses the Blockchain API to fetch the latest block and transaction details.

## Features

- Fetch and display the latest Bitcoin block details.
- Fetch and display Bitcoin transaction details.
- View transaction details on a blockchain explorer.

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter
- Android Studio: [Install Android Studio](https://developer.android.com/studio)

### Installation

1. Clone the repository:
2. ```git clone https://github.com/donkizzytezos_assessment.git```
   ```
   cd tezos_assessment
    ```
3.    Install dependencies:  
4.    flutter pub get
5.    Run the application:  
6.    flutter run


```markdown
### Install dependencies:
```sh
flutter pub get
```

### Run the application:
```sh
flutter run
```

### Running Tests

To run the unit tests and check test coverage:

#### Run tests with coverage:
```sh
flutter test --coverage
```

#### Generate a coverage report:
```sh
genhtml coverage/lcov.info -o coverage/html
```

#### View the coverage report:
```sh
open coverage/html/index.html
```

### Project Structure

- `lib/`: Contains the main source code for the application.
  - `app/`: Contains the application-specific code.
    - `data/`: Contains data models, repositories, and BLoC/Cubit classes.
    - `presentation/`: Contains UI components and pages.
  - `core/`: Contains core utilities and constants.

### Dependencies

- `flutter_bloc`: State management using BLoC pattern.
- `equatable`: Simplifies equality comparisons.
- `flutter_svg`: SVG rendering for Flutter.
- `url_launcher`: Launch URLs in the default browser.
- `mockito`: Mocking library for unit tests.
- `bloc_test`: Testing utilities for BLoC.

### License

This project is licensed under the MIT License. See the `LICENSE` file for details.


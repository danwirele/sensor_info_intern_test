# sensor_info_intern_test

## Table of Contents

- [Installation](#installation)

  - [Prerequisites](#prerequisites)

  - [Clone the Repository](#clone-the-repository)

  - [Configuration](#configuration)

  - [Build and Run](#build-and-run)

- [Usage](#usage)

- [Contributing](#contributing)

- [License](#license)

## Installation

Follow these steps to install and run sensor_info_intern_test on your system.

### Prerequisites

Before you begin, ensure you have the following dependencies and tools installed:

- [Dependency 1](#https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.16.3-stable.zip)

### Clone the Repository

1. Open your terminal or command prompt.

2. Use the following command to clone the ProjectName repository:

git clone https://github.com/danwirele/sensor_info_intern_test


### Build and Run

1. Connect your device or start an emulator.

2. To build and run the project, use the following command:

- Generate files with following command:

```bash
dart run build_runner build
```

- Run application on ur device with on of the following command:

```bash
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 80
flutter run -d android
flutter run -d windows
```
This will build the project and install it on your connected device or emulator.

### Compile release application

To compile binary application use following command:

```bash
flutter build <target>
```

For more details check [official documentation](https://docs.flutter.dev/testing/build-modes)

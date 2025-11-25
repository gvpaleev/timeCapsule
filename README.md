# TimeCapsule

A Flutter-based decentralized application for creating digital memorials on the blockchain.

## Overview

TimeCapsule is a cross-platform mobile and web application that allows users to create and manage digital memorials for people. Each memorial can store biographical information and receive comments from visitors, all recorded on the blockchain for permanent preservation.

## Features

- Create digital memorials with name, description, and photo
- Add comments to existing memorials
- Blockchain-based storage using Ethereum smart contracts
- USDT integration for transactions
- Cross-platform support (iOS, Android, Web, Windows, macOS, Linux)

## Smart Contract

Contract Address (BNB Chain): `0xcA9E56F2f817e27bED23FEFa0208CC3da60A5e6D`

The TimeCapsule smart contract provides:
- Memorial creation (owner-only)
- Public comment submission
- Permanent on-chain storage
- Comment retrieval by memorial ID

## Tech Stack

- **Framework**: Flutter 3.2.6+
- **Blockchain**: web3dart, web_socket_channel
- **State Management**: flutter_bloc
- **Local Storage**: Hive
- **Dependency Injection**: get_it
- **Environment Config**: flutter_dotenv

## Getting Started

### Prerequisites

- Flutter SDK 3.2.6 or higher
- Dart SDK
- Web3 wallet (for blockchain interactions)

### Installation

1. Clone the repository
2. Install dependencies:
```bash
flutter pub get
```

3. Configure environment variables in `.env` file

4. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── app/              # App initialization
├── features/         # Feature modules
│   └── ViewPersonPage/  # Memorial viewing functionality
├── scrypts/          # Smart contract interaction scripts
└── locator_service.dart  # Dependency injection setup
```

## License

Private project - not published to pub.dev

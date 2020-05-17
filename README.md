# Orion Talk client

This package implements both an Web Service and Web Socket Orion Talk clients APIs. It is developed in Dart, thus, you need to [install dart](https://dart.dev/get-dart) in your computer to execute the clients.

Orion Talk client has two user interfaces Web and CLI. However, make sure to first run [Orion Talk service](https://github.com/orion-services/talk) and create or get a token of a channel.

## Web

To execute the Web client is necessary to install [webdev](https://dart.dev/tools/webdev). Once webdev is installed, execute the below command in root folder:

    webdev serve

## CLI

To execute the command line client, go to `bin` directory and run:

    dart main.dart
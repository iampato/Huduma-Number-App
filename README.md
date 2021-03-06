# Huduma number app

A new Flutter project, majorly inspired by my parents. constantly asking me to
check their huduma number status.

## Tech stack
* [Flutter](http://flutter.dev/) - a cross-platform, framework for building mobile applications.
* [Dart](http://dart.dev/) - client-optimized language for fast apps on any platform.
* [flutter_bloc](https://pub.dev/packages/flutter_bloc) - event driven state management
* [moor](https://pub.dev/packages/moor_flutter) - Moor is a reactive persistence library for Flutter and Dart, built on top of sqlite.
* [Freezed](https://pub.dev/packages/freezed) - a code generator for unions/pattern-matching/copy.
* [Dio](https://pub.dev/packages/dio) - A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.


## Getting Started

The project uses flutter moor generator and freeze generator for sql and json serialization
respectively:

1. make part files

   ``make gen`` this uses a makefile to run build runner

2. flutter run

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Screenshots

The screenshot below shows the working application:

|<image src="screenshots/1.png"> | <image src="screenshots/3.png"> | <image src="screenshots/2.png">|
|:---:|:---:|:---:|
|Home page|Search history|Expanded item|



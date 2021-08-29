icons:
		flutter pub run flutter_launcher_icons:main

splash:
		flutter pub run flutter_native_splash:create

pub:
		flutter pub get

gen:
		flutter packages run build_runner build --delete-conflicting-outputs

fmt:
		flutter format lib test

apk:
		flutter build apk --release
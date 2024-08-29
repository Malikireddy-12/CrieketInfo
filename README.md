# Flutter cricket_info app (simple, meant to showcase clean architecture)

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

Cloning and running

Clone the project to your local machine by running the command git clone <project_url_here>.
Inside the project's root directory, run flutter pub get. This will retrieve the project's dependencies.
Navigate to root > lib > features > Matches_data > data > datasources > Matches_remote_data_source.dart and add your free API key from rapidapi.com to the API_KEY constant.
From the project's root directory, run flutter run --no-sound-null-safety. The latter flag is because a package the project depends on hasn't yet been upgraded to null safety.
Your app should now be running!
Additional note

This project closely echos Reso Coder's tutorial series on clean Flutter architecture. However, it differs in a few ways: not a trivia app, uses CUBIT instead of BLOC, doesn't include testing, and doesn't cache API results (Matches data needs to be live).





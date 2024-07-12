import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static get apiKey => dotenv.env['THE_MOVIE_DB_API_TOKEN'];
  static get apiUrl => dotenv.env['THE_MOVIE_DB_API_URL'];
  static get imageUrl => dotenv.env['THE_MOVIE_DB_IMAGE_URL'];
  static get blankImageUrl => dotenv.env['BLANK_IMAGE_URL'];
  static get youTubeUrl => dotenv.env['BLANK_IYOUTUBE_URLMAGE_URL'];
}

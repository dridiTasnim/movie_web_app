import 'package:movie_web_app/models/filters.dart';

class ChosenFilters {
  bool? isAgeApproriate = isAgeApproriateChoices[0];
  String? genres = genresChoices[0];
  String? languages = languagesChoices[0];
  String? duration = durationChoices[0];
  ChosenFilters(
      {this.isAgeApproriate, this.genres, this.languages, this.duration});
}

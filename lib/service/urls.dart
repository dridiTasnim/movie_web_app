class Urls {
  static String localhost = 'localhost:3003';
  static String baseUrl = 'https://api.themoviedb.org/3/';
  static String popularMovies =
      "movie/popular?api_key=89544fa5b5a4e780a17fb40324900182&language=en-US&page=1";
  static String upcomingMovies =
      "movie/upcoming?api_key=89544fa5b5a4e780a17fb40324900182&language=en-US&page=1";
  static String searchMovies =
      "search/movie?api_key=89544fa5b5a4e780a17fb40324900182&language=en-US&query=";
  static String login = 'http://localhost:3003/auth-controller/loginUser/';
  static String signUp = 'http://localhost:3003/auth-controller/addUser/';
  static String chatGPT = '/askGPT';
}

abstract class ApiEndpoints {
  static const String baseUrl = 'https://sua-api.com/api/v1';

  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';

  static const String questions = '/quiz/questions';
  static const String submitQuiz = '/quiz/submit';
  static const String results = '/quiz/results';

  static const String denounce = '/denounce';
  static const String observatory = '/observatory/stats';
}

import '../model/questionnaire.dart';

class QuestionnaireRepository {
  Future<Questionnaire> fetchQuestionnaire() async {
    await Future.delayed(Duration(milliseconds: 500));
    return Questionnaire(completionPercentage: 99);
  }
}

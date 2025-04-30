import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/questionnaire.dart';
import '../repository/questionnaire_repository.dart';

abstract class QuestionnaireEvent {}

class LoadQuestionnaire extends QuestionnaireEvent {}

abstract class QuestionnaireState {}

class QuestionnaireInitial extends QuestionnaireState {}

class QuestionnaireLoading extends QuestionnaireState {}

class QuestionnaireLoaded extends QuestionnaireState {
  final Questionnaire questionnaire;

  QuestionnaireLoaded(this.questionnaire);
}

class QuestionnaireError extends QuestionnaireState {}

class QuestionnaireBloc extends Bloc<QuestionnaireEvent, QuestionnaireState> {
  final QuestionnaireRepository repository;

  QuestionnaireBloc(this.repository) : super(QuestionnaireInitial()) {
    on<LoadQuestionnaire>((event, emit) async {
      emit(QuestionnaireLoading());
      try {
        final data = await repository.fetchQuestionnaire();
        emit(QuestionnaireLoaded(data));
      } catch (_) {
        emit(QuestionnaireError());
      }
    });
  }
}

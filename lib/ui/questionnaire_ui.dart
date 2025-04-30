import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/questionnaire_bloc.dart';
import '../repository/questionnaire_repository.dart';

class QuestionnaireUI extends StatelessWidget {
  const QuestionnaireUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              QuestionnaireBloc(QuestionnaireRepository())
                ..add(LoadQuestionnaire()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Опросник'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Container(
                color: Colors.grey,
                height: 1.0),
          ),
        ),
        body: Center(
          child: BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
            builder: (context, state) {
              if (state is QuestionnaireLoading) {
                return const CircularProgressIndicator();
              } else if (state is QuestionnaireLoaded) {
                final percent = state.questionnaire.completionPercentage;
                String status;
                if (percent == 0) {
                  status = "Не заполнен";
                } else if (percent < 100) {
                  status = "В процессе заполнения \n($percent%)";
                } else {
                  status = "Полностью заполнен";
                }
                return Text(status, style: const TextStyle(fontSize: 24), textAlign: TextAlign.center,);
              } else if (state is QuestionnaireError) {
                return const Text('Ошибка загрузки');
              }
              return const Text('Ожидание загрузки...');
            },
          ),
        ),
      ),
    );
  }
}

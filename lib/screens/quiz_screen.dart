import 'package:flutter/material.dart';
import '../data/questions_data.dart';
import '../models/question_model.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> categoryQuestions;
  int currentQuestion = 0;
  int score = 0;
  bool answered = false;
  int? selectedOption;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final category = ModalRoute.of(context)!.settings.arguments as String?;
    
    if (category != null && categorizedQuestions.containsKey(category)) {
      // If a specific category is selected, use questions from that category
      categoryQuestions = categorizedQuestions[category]!;
    } else {
      // If no category is selected or category doesn't exist, use all questions
      categoryQuestions = [];
      categorizedQuestions.forEach((_, questions) {
        categoryQuestions.addAll(questions);
      });
    }
  }

  void answer(int index) {
    if (!answered) {
      setState(() {
        selectedOption = index;
        answered = true;
        if (categoryQuestions[currentQuestion].correctAnswerIndex == index) {
          score++;
        }
      });
    }
  }

  void nextQuestion() {
    if (currentQuestion < categoryQuestions.length - 1) {
      setState(() {
        currentQuestion++;
        answered = false;
        selectedOption = null;
      });
    } else {
      Navigator.pushReplacementNamed(context, '/result', arguments: score);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (categoryQuestions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Quiz')),
        body: Center(child: Text('No questions available.')),
      );
    }
    final q = categoryQuestions[currentQuestion];
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Question ${currentQuestion + 1}/${categoryQuestions.length}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text(q.questionText, style: TextStyle(fontSize: 20)),
            SizedBox(height: 24),
            ...List.generate(q.options.length, (i) {
              return ListTile(
                title: Text(q.options[i]),
                tileColor: selectedOption == i
                  ? (i == q.correctAnswerIndex ? Colors.green[100] : Colors.red[100])
                  : null,
                onTap: answered ? null : () => answer(i),
              );
            }),
            SizedBox(height: 24),
            if (answered)
              ElevatedButton(
                onPressed: nextQuestion,
                child: Text(currentQuestion < categoryQuestions.length - 1 ? 'Next' : 'See Result'),
              ),
          ],
        ),
      ),
    );
  }
}

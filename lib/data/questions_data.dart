import '../models/question_model.dart';

final List<Question> questions = [
  Question(
    questionText: 'What is the capital of France?',
    options: ['Paris', 'London', 'Berlin', 'Madrid'],
    correctAnswerIndex: 0,
    category: 'Geography',
  ),
  Question(
    questionText: 'What is 2 + 2?',
    options: ['3', '4', '5', '6'],
    correctAnswerIndex: 1,
    category: 'Math',
  ),
  Question(
    questionText: 'Who wrote Hamlet?',
    options: ['Shakespeare', 'Dickens', 'Tolstoy', 'Hemingway'],
    correctAnswerIndex: 0,
    category: 'Literature',
  ),
];

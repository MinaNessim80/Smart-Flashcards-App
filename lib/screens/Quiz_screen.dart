import 'package:flutter/material.dart';
import '../data/questions_data.dart';
import '../models/question_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> categoryQuestions;
  late List<Question> selectedQuestions;
  int currentQuestion = 0;
  int score = 0;
  bool answered = false;
  int? selectedOption;
  bool quizStarted = false;
  int numberOfQuestions = 25; // Default number of questions
  
  // Define the color scheme
  final Color primaryColor = Color(0xFF6A5ADF);
  final Color secondaryColor = Color(0xFF7267E3);
  final Color backgroundColor = Color(0xFFFEFFFE);

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
    
    // Shuffle the questions to randomize them
    categoryQuestions.shuffle();
    
    // Set the default number of questions to a valid value
    setState(() {
      numberOfQuestions = numberOfQuestions.clamp(1, categoryQuestions.isEmpty ? 10 : categoryQuestions.length);
    });
  }

  // Start the quiz with the selected number of questions
  void startQuiz() {
    setState(() {
      // Limit the number of questions to what's available
      numberOfQuestions = numberOfQuestions.clamp(1, categoryQuestions.length);
      
      // Select the first N questions
      selectedQuestions = categoryQuestions.take(numberOfQuestions).toList();
      
      quizStarted = true;
    });
  }

  void answer(int index) {
    if (!answered) {
      setState(() {
        selectedOption = index;
        answered = true;
        if (selectedQuestions[currentQuestion].correctAnswerIndex == index) {
          score++;
        }
      });
    }
  }

  void nextQuestion() {
    if (currentQuestion < selectedQuestions.length - 1) {
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
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text('Quiz', style: TextStyle(color: backgroundColor)),
          backgroundColor: primaryColor,
          elevation: 0,
        ),
        body: Center(
          child: Text(
            'No questions available.',
            style: TextStyle(fontSize: 18, color: primaryColor),
          ),
        ),
      );
    }
    
    // Show question selection screen if quiz hasn't started
    if (!quizStarted) {
      return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text('Quiz Setup', style: TextStyle(color: backgroundColor)),
          backgroundColor: primaryColor,
          elevation: 0,
          iconTheme: IconThemeData(color: backgroundColor),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Choose the number of questions',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Text(
                    '$numberOfQuestions',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: 20),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: secondaryColor,
                      inactiveTrackColor: Colors.grey[300],
                      thumbColor: primaryColor,
                      overlayColor: primaryColor.withOpacity(0.2),
                      trackHeight: 8,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 24),
                    ),
                    child: Slider(
                      min: 1,
                      max: categoryQuestions.isEmpty ? 10 : categoryQuestions.length.toDouble(),
                      value: numberOfQuestions.toDouble().clamp(1, categoryQuestions.isEmpty ? 10 : categoryQuestions.length.toDouble()),
                      onChanged: (value) {
                        setState(() {
                          numberOfQuestions = value.round();
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: startQuiz,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondaryColor,
                        foregroundColor: backgroundColor,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    
    // Show the quiz screen once started
    final q = selectedQuestions[currentQuestion];
    
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Quiz', style: TextStyle(color: backgroundColor)),
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: backgroundColor),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress indicator and question counter
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: (currentQuestion + 1) / selectedQuestions.length,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(secondaryColor),
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    '${currentQuestion + 1}/${selectedQuestions.length}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 30),
              
              // Question text
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  q.questionText,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
              
              SizedBox(height: 30),
              
              // Answer options
              Expanded(
                child: ListView.separated(
                  itemCount: q.options.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12),
                  itemBuilder: (context, i) {
                    // Determine the colors based on selection and correctness
                    Color cardColor = backgroundColor;
                    Color textColor = Colors.black87;
                    Color borderColor = Colors.grey.withOpacity(0.3);
                    
                    if (answered && selectedOption == i) {
                      if (i == q.correctAnswerIndex) {
                        cardColor = Colors.green.withOpacity(0.2);
                        borderColor = Colors.green;
                        textColor = Colors.green.shade800;
                      } else {
                        cardColor = Colors.red.withOpacity(0.2);
                        borderColor = Colors.red;
                        textColor = Colors.red.shade800;
                      }
                    } else if (answered && i == q.correctAnswerIndex) {
                      cardColor = Colors.green.withOpacity(0.2);
                      borderColor = Colors.green;
                      textColor = Colors.green.shade800;
                    }
                    
                    return InkWell(
                      onTap: answered ? null : () => answer(i),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: borderColor, width: 2),
                          boxShadow: answered && (selectedOption == i || i == q.correctAnswerIndex)
                            ? [BoxShadow(
                                color: borderColor.withOpacity(0.3),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              )]
                            : null,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: answered 
                                  ? (i == q.correctAnswerIndex ? Colors.green : (selectedOption == i ? Colors.red : secondaryColor.withOpacity(0.2)))
                                  : secondaryColor.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                String.fromCharCode(65 + i), // A, B, C, D...
                                style: TextStyle(
                                  color: answered 
                                    ? (i == q.correctAnswerIndex ? Colors.white : (selectedOption == i ? Colors.white : primaryColor))
                                    : primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                q.options[i],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: textColor,
                                  fontWeight: answered && (selectedOption == i || i == q.correctAnswerIndex) 
                                    ? FontWeight.bold 
                                    : FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              SizedBox(height: 20),
              
              // Next button
              if (answered)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                      foregroundColor: backgroundColor,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      currentQuestion < selectedQuestions.length - 1 ? 'Next Question' : 'See Results',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

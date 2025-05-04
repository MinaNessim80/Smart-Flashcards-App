import 'package:flutter/material.dart';
import '../models/question_model.dart';

class ResultScreen extends StatelessWidget {
  
  final Color primaryColor = Color(0xFF6A5ADF);
  final Color secondaryColor = Color(0xFF7267E3);
  final Color backgroundColor = Color(0xFFFEFFFE);

  @override
  Widget build(BuildContext context) {
    
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    
    final int score = args['score'] as int? ?? 0;
    final List<Question> questions = args['questions'] as List<Question>? ?? [];
    final int totalQuestions = args['totalQuestions'] as int? ?? 10;
    
    final double percentage = (score / totalQuestions) * 100;
    
    
    String performanceMessage;
    Color performanceColor;
    
    if (percentage >= 80) {
      performanceMessage = "Excellent!";
      performanceColor = Colors.green;
    } else if (percentage >= 60) {
      performanceMessage = "Good Job!";
      performanceColor = Colors.blue;
    } else if (percentage >= 40) {
      performanceMessage = "Not Bad!";
      performanceColor = Colors.orange;
    } else {
      performanceMessage = "Keep Practicing!";
      performanceColor = Colors.red;
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Quiz Results', style: TextStyle(color: backgroundColor)),
        backgroundColor: primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Text(
                  performanceMessage,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: performanceColor,
                  ),
                ),
                SizedBox(height: 30),
                
                
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(
                        value: score / totalQuestions,
                        strokeWidth: 15,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(performanceColor),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          '$score',
                          style: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          'out of $totalQuestions',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                SizedBox(height: 40),
                
                
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: performanceColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${percentage.toStringAsFixed(0)}%',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: performanceColor,
                    ),
                  ),
                ),
                
                SizedBox(height: 50),
                
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false),
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondaryColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        
                        Navigator.pushReplacementNamed(
                          context, 
                          '/quiz',
                          arguments: {
                            'reuseQuestions': true,
                            'questions': questions,
                          }
                        );
                      },
                      icon: Icon(Icons.refresh),
                      label: Text('Try Again'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

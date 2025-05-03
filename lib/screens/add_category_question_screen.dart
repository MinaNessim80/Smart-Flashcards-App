import 'package:flutter/material.dart';
import '../data/questions_data.dart';
import '../models/question_model.dart';

class AddCategoryQuestionScreen extends StatefulWidget {
  @override
  _AddCategoryQuestionScreenState createState() => _AddCategoryQuestionScreenState();
}

class _AddCategoryQuestionScreenState extends State<AddCategoryQuestionScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();
  final List<TextEditingController> _optionControllers = List.generate(4, (_) => TextEditingController());
  int _correctAnswerIndex = 0;

  void _addCategoryAndQuestion() {
    if (_formKey.currentState!.validate()) {
      String category = _categoryController.text.trim();
      String questionText = _questionController.text.trim();
      List<String> options = _optionControllers.map((c) => c.text.trim()).toList();
      if (!options.contains('')) {
        // Add category if not exists
        if (!questions.any((q) => q.category == category)) {
          // Just add the question, categories are inferred from questions
        }
        // Add question
        questions.add(Question(
          questionText: questionText,
          options: options,
          correctAnswerIndex: _correctAnswerIndex,
          category: category,
        ));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Category and question added!')));
        _categoryController.clear();
        _questionController.clear();
        _optionControllers.forEach((c) => c.clear());
        setState(() { _correctAnswerIndex = 0; });
      }
    }
  }

  @override
  void dispose() {
    _categoryController.dispose();
    _questionController.dispose();
    _optionControllers.forEach((c) => c.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Category & Question')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Category'),
                validator: (v) => v == null || v.trim().isEmpty ? 'Enter a category' : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _questionController,
                decoration: InputDecoration(labelText: 'Question'),
                validator: (v) => v == null || v.trim().isEmpty ? 'Enter a question' : null,
              ),
              SizedBox(height: 12),
              ...List.generate(4, (i) => TextFormField(
                controller: _optionControllers[i],
                decoration: InputDecoration(labelText: 'Option ${i + 1}'),
                validator: (v) => v == null || v.trim().isEmpty ? 'Enter option ${i + 1}' : null,
              )),
              SizedBox(height: 12),
              DropdownButtonFormField<int>(
                value: _correctAnswerIndex,
                items: List.generate(4, (i) => DropdownMenuItem(
                  value: i,
                  child: Text('Option ${i + 1}'),
                )),
                onChanged: (v) => setState(() { _correctAnswerIndex = v ?? 0; }),
                decoration: InputDecoration(labelText: 'Correct Answer'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addCategoryAndQuestion,
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

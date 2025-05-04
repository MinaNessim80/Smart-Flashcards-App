import '../models/question_model.dart';

final Map<String, List<Question>> categorizedQuestions = {
  'Flutter': [
    Question(
      questionText: 'What is Flutter primarily used for?',
      options: ['Web development', 'Mobile app development', 'Desktop applications', 'All of the above'],
      correctAnswerIndex: 3,
    ),
    Question(
      questionText: 'Which programming language is Flutter based on?',
      options: ['Java', 'Dart', 'Kotlin', 'Swift'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What widget is used for a scrollable list in Flutter?',
      options: ['ListView', 'Column', 'Row', 'Container'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'What command is used to create a new Flutter project?',
      options: ['flutter init', 'flutter create', 'flutter new', 'flutter start'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Which widget is the root of a Flutter app?',
      options: ['MaterialApp', 'Scaffold', 'Container', 'MainApp'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'What is the purpose of the pubspec.yaml file?',
      options: ['App configuration', 'Dependency management', 'UI layout', 'State management'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is a StatefulWidget in Flutter?',
      options: ['A widget that cannot change', 'A widget with mutable state', 'A layout widget', 'A navigation widget'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'How do you update the UI when state changes in a StatefulWidget?',
      options: ['Call updateUI()', 'Call refresh()', 'Call setState()', 'It updates automatically'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'What is the purpose of the BuildContext in Flutter?',
      options: ['Handle user input', 'Manage app state', 'Locate widgets in the tree', 'Handle network requests'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Which package is commonly used for HTTP requests in Flutter?',
      options: ['http', 'dio', 'chopper', 'All of the above'],
      correctAnswerIndex: 3,
    ),
  ],
  'Python': [
    Question(
      questionText: 'What is Python primarily used for?',
      options: ['Game development', 'Web development', 'Data analysis', 'All of the above'],
      correctAnswerIndex: 3,
    ),
    Question(
      questionText: 'How do you create a list in Python?',
      options: ['{1, 2, 3}', '[1, 2, 3]', '(1, 2, 3)', '<1, 2, 3>'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the output of print(3 * "abc") in Python?',
      options: ['abcabcabc', '3abc', 'abc abc abc', 'Error'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Which keyword is used to define a function in Python?',
      options: ['func', 'def', 'function', 'fn'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is PEP 8?',
      options: ['Python Enhancement Proposal', 'Python Error Protocol', 'Package management system', 'Performance optimization tool'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'How do you open a file in Python?',
      options: ['open("file.txt")', 'file.open("file.txt")', 'File("file.txt").open()', 'openFile("file.txt")'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'What does the __init__ method do in a Python class?',
      options: ['Initializes the class', 'Destroys the class', 'Imports modules', 'Handles errors'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Which module is used for regular expressions in Python?',
      options: ['regex', 're', 'pyre', 'pattern'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the result of 5 // 2 in Python?',
      options: ['2.5', '2', '3', '2.0'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'How do you create a virtual environment in Python?',
      options: ['python -m venv env', 'python create env', 'virtualenv new', 'python env create'],
      correctAnswerIndex: 0,
    ),
  ],
  'Dart': [
    Question(
      questionText: 'What is Dart primarily used for?',
      options: ['Backend development', 'Flutter apps', 'Game development', 'Machine learning'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'How do you declare a variable in Dart that cannot change?',
      options: ['var', 'let', 'const', 'final'],
      correctAnswerIndex: 3,
    ),
    Question(
      questionText: 'What is the entry point of a Dart program?',
      options: ['main()', 'init()', 'start()', 'run()'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Which keyword is used for null safety in Dart?',
      options: ['?', '!', '??', 'All of the above'],
      correctAnswerIndex: 3,
    ),
    Question(
      questionText: 'What is a Future in Dart?',
      options: ['A promise of a value', 'A data type', 'An error handler', 'A loop construct'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'How do you create a list in Dart?',
      options: ['List<String> list = []', 'var list = List()', 'List list = new List()', 'All of the above'],
      correctAnswerIndex: 3,
    ),
    Question(
      questionText: 'What is the purpose of async/await in Dart?',
      options: ['Synchronous programming', 'Asynchronous programming', 'Error handling', 'Memory management'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'How do you handle exceptions in Dart?',
      options: ['try/catch', 'onError', 'exception', 'handle'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'What is a mixin in Dart?',
      options: ['A class', 'A way to reuse code', 'An interface', 'A function'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Which operator is used for type casting in Dart?',
      options: ['as', 'is', 'cast', 'to'],
      correctAnswerIndex: 0,
    ),
  ],
  'AI': [
    Question(
      questionText: 'What does AI stand for?',
      options: ['Automated Intelligence', 'Artificial Intelligence', 'Advanced Interface', 'Algorithmic Inference'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Which of these is a machine learning algorithm?',
      options: ['Random Forest', 'Binary Search', 'Bubble Sort', 'Dijkstra\'s Algorithm'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'What is TensorFlow?',
      options: ['A programming language', 'A machine learning library', 'A database system', 'A cloud platform'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the purpose of a neural network?',
      options: ['Data storage', 'Pattern recognition', 'Network communication', 'File compression'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Which of these is a type of machine learning?',
      options: ['Supervised learning', 'Unsupervised learning', 'Reinforcement learning', 'All of the above'],
      correctAnswerIndex: 3,
    ),
    Question(
      questionText: 'What is NLP in AI?',
      options: ['Neural Language Processing', 'Natural Language Processing', 'Network Learning Protocol', 'Next-Level Programming'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is overfitting in machine learning?',
      options: ['Model is too simple', 'Model performs well on training data but poorly on new data', 'Model is too slow', 'Model uses too much memory'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Which company developed ChatGPT?',
      options: ['Google', 'OpenAI', 'Microsoft', 'Facebook'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is a GAN in AI?',
      options: ['General Artificial Network', 'Generative Adversarial Network', 'Graphical Analysis Node', 'Global Access Network'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the Turing Test used for?',
      options: ['Testing computer speed', 'Evaluating AI\'s ability to exhibit human-like intelligence', 'Measuring network latency', 'Assessing programming skills'],
      correctAnswerIndex: 1,
    ),
  ],
  'Data Science': [
    Question(
      questionText: 'What is the primary language for data science?',
      options: ['Java', 'Python', 'C++', 'JavaScript'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is pandas in Python?',
      options: ['A zoo animal', 'A data analysis library', 'A machine learning algorithm', 'A visualization tool'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the purpose of NumPy?',
      options: ['Web development', 'Numerical computing', 'Game development', 'Mobile app development'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is a DataFrame?',
      options: ['A 2D labeled data structure', 'A type of chart', 'A database table', 'A file format'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Which library is used for data visualization in Python?',
      options: ['Matplotlib', 'Pandas', 'Scikit-learn', 'TensorFlow'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'What is feature engineering?',
      options: ['Building physical features', 'Creating new input features for machine learning', 'Designing UI features', 'Optimizing hardware features'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the purpose of Jupyter Notebook?',
      options: ['Web browsing', 'Interactive computing', 'Game development', 'Mobile app testing'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is SQL used for in data science?',
      options: ['Data visualization', 'Data manipulation and retrieval', 'Machine learning', 'Web development'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the purpose of data cleaning?',
      options: ['To make data more secure', 'To prepare data for analysis', 'To compress data', 'To encrypt data'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is a common technique for handling missing data?',
      options: ['Imputation', 'Deletion', 'Both A and B', 'Ignoring it'],
      correctAnswerIndex: 2,
    ),
  ],
};
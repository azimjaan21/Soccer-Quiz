import 'package:flutter/material.dart';

import '../widgets/question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

bool iconbool = false;
IconData iconLight = Icons.wb_sunny;
IconData iconDark = Icons.nights_stay;

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);
ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.indigo,
  brightness: Brightness.dark,
);

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> answerAndQuestion = [
    {
      'question': 'Which country won the FIFA World Cup in 2018?',
      'answers': [
        {'answer': 'Brazil', 'isTrue': false},
        {'answer': 'France', 'isTrue': true},
        {'answer': 'Germany', 'isTrue': false},
        {'answer': 'Spain', 'isTrue': false},
      ]
    },
    {
      'question': 'Which club has won the most UEFA Champions League titles?',
      'answers': [
        {'answer': 'Real Madrid', 'isTrue': true},
        {'answer': 'Barcelona', 'isTrue': false},
        {'answer': 'Manchester United', 'isTrue': false},
        {'answer': 'Juventus', 'isTrue': false},
      ]
    },
    {
      'question': 'Who is the most expensive football player in history as of 2021?',
      'answers': [
        {'answer': 'Lionel Messi(€180 million)', 'isTrue': false},
        {'answer': 'Rahim Sterling(€80 million)', 'isTrue': false},
        {'answer': 'Vini Jr(€120 million)', 'isTrue': false},
        {'answer': 'Neymar Jr(€222 million)', 'isTrue': true},
      ]
    },
    {
      'question': 'Who holds the record for the fastest hat-trick in Premier League history?',
      'answers': [
        {'answer': 'Sadio Mané (2 min.56 sec)', 'isTrue': true},
        {'answer': 'Harry Kane (3 min.24 sec)', 'isTrue': false},
        {'answer': 'Van Nestroy (2 min.45 sec)', 'isTrue': false},
        {'answer': 'Mohammed Salah (3 min.12 sec)', 'isTrue': false},
      ]
    },
     {
      'question': 'Which player has scored the most goals in a single UEFA Champions League season?',
      'answers': [
        {'answer': 'Lionel Messi(16 goals)', 'isTrue': false},
        {'answer': 'Cristiano Ronaldo (17 goals)', 'isTrue': true},
        {'answer': 'Neymar Jr(12 goals)', 'isTrue': false},
        {'answer': 'Robert Lewandowski (22 goals)', 'isTrue': false},
      ]
    },
    {
      'question': 'Which country has won the most Copa America titles?',
      'answers': [
        {'answer': 'Brazil', 'isTrue': false},
        {'answer': 'Mexico', 'isTrue': false},
        {'answer': 'Uruguay', 'isTrue': true},
        {'answer': 'Argentina', 'isTrue': false},
      ]
    },
    {
      'question': 'Which player has won the most Premier League Golden Boot awards?',
      'answers': [
        {'answer': 'Mohammed Salah', 'isTrue': false},
        {'answer': 'Cristiano Ronaldo ', 'isTrue': false},
        {'answer': 'Harry Kane', 'isTrue': false},
        {'answer': 'Alan Shearer', 'isTrue': true},
      ]
    },
    {
      'question': 'Who is the all-time leading goal scorer for the Spanish national team?',
      'answers': [
        {'answer': 'Andre Iniesta', 'isTrue': false},
        {'answer': 'David Silva ', 'isTrue': false},
        {'answer': 'Morata', 'isTrue': false},
        {'answer': 'David Villa', 'isTrue': true},
      ]
    },
    {
      'question': 'Which club has won the most English Premier League titles?',
      'answers': [
        {'answer': 'Liverpool', 'isTrue': false},
        {'answer': 'Arsenal', 'isTrue': false},
        {'answer': 'Manchester United', 'isTrue': true},
        {'answer': 'Chelsea', 'isTrue': false},
      ]
    },
    {
      'question': 'Which club has won the most UEFA Europa League titles?',
      'answers': [
        {'answer': 'Juventus', 'isTrue': false},
        {'answer': 'Arsenal', 'isTrue': false},
        {'answer': 'Real Madrid', 'isTrue': false},
        {'answer': 'Sevilla', 'isTrue': true},
      ]
    },
  ];

  String question = '1-savol';
  int currentIndex = 0;
  int result = 0;

  void answerQuestion(bool isTrue) {
    setState(() {
      currentIndex++;

      if (isTrue) {
        result++;
      }
    });
  }

  void restartQuiz() {
    setState(() {
      currentIndex = 0;
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: iconbool ? darkTheme : lightTheme,
      title: 'Soccer Quiz',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  iconbool = !iconbool;
                });
              },
              icon: Icon(
                iconbool ? iconDark : iconLight,
              ),
            ),
          ],
          title: const Text('Soccer Quiz'),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
'https://images.unsplash.com/photo-1511204338744-5d4e9b3ffee0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=902&q=80',              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: currentIndex < answerAndQuestion.length
                ? Center(
                  child: QuestionWidget(
                      question: answerAndQuestion[currentIndex]['question'],
                      answers: answerAndQuestion[currentIndex]['answers'],
                      answerForQuestion: answerQuestion,
                    ),
                )
                : Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 5),
                      height: 280,
                      width: 380,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(255, 11, 103, 179), width: 4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Your Result:',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            '$result/10',
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ElevatedButton.icon(
                            onPressed: restartQuiz,
                            icon: const Icon(Icons.restart_alt_outlined),
                            label: const Text(
                              'Start again',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
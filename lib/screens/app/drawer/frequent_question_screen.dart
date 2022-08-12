import 'package:flutter/material.dart';
import '../../../models/faq.dart';

class FrequentQuestionScreen extends StatefulWidget {
  const FrequentQuestionScreen({Key? key}) : super(key: key);

  @override
  _FrequentQuestionScreenState createState() => _FrequentQuestionScreenState();
}

class _FrequentQuestionScreenState extends State<FrequentQuestionScreen> {
  final List<Faq> _faqs = <Faq>[
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
    Faq(question: 'question #', answer: 'answer #'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQS'),
      ),
      body: ListView.builder(
        itemCount: _faqs.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text(_faqs[index].question),
            leading: const Icon(Icons.question_answer),
            initiallyExpanded: false,
            expandedAlignment: Alignment.topRight,
            expandedCrossAxisAlignment: CrossAxisAlignment.end,
            tilePadding: const EdgeInsets.all(5),
            childrenPadding: const EdgeInsets.all(10),
            // expanded text color
            textColor: Colors.red,
            backgroundColor: Colors.purple.shade300,
            iconColor: Colors.white,
            //collapsed
            collapsedTextColor: Colors.pink,
            collapsedBackgroundColor: Colors.grey.shade300,
            collapsedIconColor: Colors.black38,

            onExpansionChanged: (bool value) {
              print(value);
            },
            children: [
              Text(_faqs[index].answer),
            ],
          );
        },
      ),
    );
  }
}

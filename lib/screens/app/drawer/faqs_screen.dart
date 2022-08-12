import 'package:flutter/material.dart';
import 'package:on_boarding_elancer2/models/faq.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  _FaqsScreenState createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
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
      appBar: AppBar(title: const Text('Faqs')),
      body: ListView(
        children: [
          ExpansionPanelList(
            elevation: 4,
            dividerColor: Colors.blue,
            animationDuration: const Duration(seconds: 1),
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (panelIndex, isExpanded) {
              setState(() => _faqs[panelIndex].isExpanded = !isExpanded);
            },
            children: _faqs
                .map(
                  (faq) => ExpansionPanel(
                    backgroundColor: Colors.grey,
                    canTapOnHeader: true,
                      isExpanded: faq.isExpanded,
                      headerBuilder: (context, isExpanded) {
                        return Text(faq.question);
                      },
                      body: Text(faq.answer)),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

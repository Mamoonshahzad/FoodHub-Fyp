import 'package:flutter/material.dart';

class freq_ask_quest extends StatelessWidget {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: 'What is your return policy?',
      answer:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquam sem et malesuada dignissim. Suspendisse a faucibus enim. In et semper neque. Vestibulum rutrum semper dolor, ut tristique neque eleifend id.',
    ),
    FAQItem(
      question: 'How can I track my order?',
      answer:
      'Duis nec mauris sem. Mauris scelerisque augue nec aliquet eleifend. Sed laoreet euismod dui in ullamcorper. Curabitur vitae neque sit amet neque consectetur rhoncus.',
    ),
    FAQItem(
      question: 'Do you offer international shipping?',
      answer:
      'Nam aliquet sapien quis justo volutpat, at placerat leo posuere. Proin rhoncus bibendum interdum. Aenean ac felis id felis consequat finibus.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.3,
        title: const Text(
          "FAQs",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: faqItems.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              faqItems[index].question,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  faqItems[index].answer,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
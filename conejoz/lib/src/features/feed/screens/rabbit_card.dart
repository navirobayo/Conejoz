import 'package:flutter/material.dart';

class RabbitCard extends StatelessWidget {
  const RabbitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rabbit Card'),
      ),
      body: Center(
        child: ListView(
          children: [Text('Rabbit Card')],
        ),
      ),
    );
  }
}

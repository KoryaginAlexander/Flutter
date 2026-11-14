import 'package:flutter/material.dart';
import 'home_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Archiver;
    return Scaffold(backgroundColor: const Color(0xFFF1F8E9), appBar: AppBar(title: Text(item.name), backgroundColor: const Color(0xFF7CB342), foregroundColor: Colors.white), body: Center(child: SingleChildScrollView(padding: const EdgeInsets.all(24), child: Column(mainAxisSize: MainAxisSize.min, children: [
      Container(width: 200, height: 200, padding: const EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28)), child: Image.asset(item.image)),
      const SizedBox(height: 24), Text(item.name, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF33691E))),
      const SizedBox(height: 16), Text(item.description, textAlign: TextAlign.center, style: const TextStyle(fontSize: 19)),
      const SizedBox(height: 28), FilledButton.icon(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back), label: const Text('Назад')),
    ]))));
  }
}

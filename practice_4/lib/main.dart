import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ArchiverPage(),
    );
  }
}

// Описание одного архиватора
class Archiver {
  final String name;
  final String description;
  final String image;
  final IconData icon;

  const Archiver(this.name, this.description, this.image, this.icon);
}

class ArchiverPage extends StatelessWidget {
  const ArchiverPage({super.key});

  static const Color green = Color(0xFF7CB342);
  static const Color darkGreen = Color(0xFF33691E);
  static const Color background = Color(0xFFF1F8E9);

  static const List<Archiver> items = [
    Archiver('WinRAR', 'Форматы RAR и ZIP, шифрование',
        'assets/images/winrar.png', Icons.folder_zip),
    Archiver('7-Zip', 'Бесплатный, собственный формат 7z',
        'assets/images/7zip.png', Icons.compress),
    Archiver('WinZip', 'Классика формата ZIP',
        'assets/images/winzip.png', Icons.archive),
    Archiver('PeaZip', 'Открытый код, много форматов',
        'assets/images/peazip.png', Icons.unarchive),
    Archiver('B1 Free Archiver', 'Кроссплатформенный, формат B1',
        'assets/images/b1free.png', Icons.inventory_2),
  ];

  void _showSnack(BuildContext context, String name) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Выбрано: $name'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: darkGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text(
          'Архиваторы',
          style: TextStyle(fontFamily: 'Pacifico', fontSize: 28),
        ),
        centerTitle: true,
        backgroundColor: green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Программы для сжатия данных',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: darkGreen,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Выберите архиватор из списка ниже',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 16),
            // Горизонтальный ListView со скруглёнными картинками
            SizedBox(
              height: 130,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Container(
                      width: 130,
                      color: Colors.white,
                      padding: const EdgeInsets.all(16),
                      child: Image.asset(
                        items[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Вертикальный ListView из карточек
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: ListTile(
                      leading: Icon(item.icon, color: green, size: 30),
                      title: Text(
                        item.name,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(item.description),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                      onTap: () => _showSnack(context, item.name),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: const BoxDecoration(
                    color: green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person, size: 30, color: Colors.white),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Корягин А.Д. ИКБО-61-23',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

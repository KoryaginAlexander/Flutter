import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../routes.dart';

class Archiver {
  final String name, description, image;
  final IconData icon;
  const Archiver(this.name, this.description, this.image, this.icon);
}

const archivers = [
  Archiver('WinRAR', 'Форматы RAR и ZIP, шифрование', 'assets/images/winrar.png', Icons.folder_zip),
  Archiver('7-Zip', 'Бесплатный, собственный формат 7z', 'assets/images/7zip.png', Icons.compress),
  Archiver('WinZip', 'Классика формата ZIP', 'assets/images/winzip.png', Icons.archive),
  Archiver('PeaZip', 'Открытый код, много форматов', 'assets/images/peazip.png', Icons.unarchive),
  Archiver('B1 Free Archiver', 'Кроссплатформенный, формат B1', 'assets/images/b1free.png', Icons.inventory_2),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final desktop = kIsWeb || {TargetPlatform.windows, TargetPlatform.macOS, TargetPlatform.linux}.contains(defaultTargetPlatform);
    final gap = desktop ? 28.0 : 16.0;
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(title: const Text('Архиваторы', style: TextStyle(fontFamily: 'Pacifico', fontSize: 28)), centerTitle: true, backgroundColor: const Color(0xFF7CB342), foregroundColor: Colors.white, automaticallyImplyLeading: false),
      body: Padding(padding: EdgeInsets.fromLTRB(16, gap, 16, 12), child: SingleChildScrollView(child: Column(children: [
        const Text('Программы для сжатия данных', textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF33691E))),
        const SizedBox(height: 8), const Text('Выберите архиватор из списка ниже', style: TextStyle(color: Colors.black54)),
        SizedBox(height: gap),
        SizedBox(height: 120, child: ListView.separated(scrollDirection: Axis.horizontal, itemCount: archivers.length, separatorBuilder: (_, _) => const SizedBox(width: 12), itemBuilder: (context, i) => InkWell(onTap: () => Navigator.pushNamed(context, Routes.detail, arguments: archivers[i]), child: Container(width: 120, padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)), child: Image.asset(archivers[i].image))))),
        SizedBox(height: gap),
        LayoutBuilder(builder: (context, constraints) {
          Widget card(int i) { final item = archivers[i]; return Card(margin: const EdgeInsets.all(5), child: ListTile(leading: Icon(item.icon, color: const Color(0xFF7CB342)), title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600)), subtitle: Text(item.description), trailing: const Icon(Icons.chevron_right), onTap: () => Navigator.pushNamed(context, Routes.detail, arguments: item))); }
          return MediaQuery.sizeOf(context).width > 600 ? GridView.builder(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: archivers.length, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 100), itemBuilder: (_, i) => card(i)) : ListView.builder(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: archivers.length, itemBuilder: (_, i) => card(i));
        }),
        const Row(children: [CircleAvatar(backgroundColor: Color(0xFF7CB342), child: Icon(Icons.person, color: Colors.white)), SizedBox(width: 12), Text('Корягин А.Д. ИКБО-61-23')]),
      ]))),
      bottomNavigationBar: NavigationBar(selectedIndex: 0, onDestinationSelected: (index) { if (index == 1) Navigator.pushNamed(context, Routes.profile); }, destinations: const [NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Главная'), NavigationDestination(icon: Icon(Icons.person_outline), label: 'Профиль')]),
    );
  }
}


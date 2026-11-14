import 'package:flutter/material.dart';
import '../models/archiver.dart';

const archivers = [
  Archiver('WinRAR', 'Форматы RAR и ZIP, шифрование', 'assets/images/winrar.png', Icons.folder_zip),
  Archiver('7-Zip', 'Бесплатный, собственный формат 7z', 'assets/images/7zip.png', Icons.compress),
  Archiver('WinZip', 'Классика формата ZIP', 'assets/images/winzip.png', Icons.archive),
  Archiver('PeaZip', 'Открытый код, много форматов', 'assets/images/peazip.png', Icons.unarchive),
  Archiver('B1 Free Archiver', 'Кроссплатформенный, формат B1', 'assets/images/b1free.png', Icons.inventory_2),
];



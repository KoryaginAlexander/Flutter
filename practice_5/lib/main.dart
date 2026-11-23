import 'package:flutter/material.dart'; // Подключаем библиотеку или файл.
import 'pages/login_page.dart'; // Подключаем библиотеку или файл.

void main() { // Продолжаем описание элемента.
  runApp(const MyApp()); // Запускаем приложение.
} // Закрываем блок.

class MyApp extends StatelessWidget { // Объявляем класс.
  const MyApp({super.key}); // Продолжаем описание элемента.

  @override // Переопределяем унаследованный метод.
  Widget build(BuildContext context) { // Строим интерфейс.
    return MaterialApp( // Возвращаем результат.
      debugShowCheckedModeBanner: false, // Задаём параметр.
      title: 'Forms', // Задаём параметр.
      theme: ThemeData( // Задаём параметр.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7CB342)), // Задаём цвет.
        useMaterial3: true, // Задаём параметр.
      ), // Завершаем описание элемента.
      home: const LoginPage(), // Задаём параметр.
    ); // Завершаем описание элемента.
  } // Закрываем блок.
} // Закрываем блок.

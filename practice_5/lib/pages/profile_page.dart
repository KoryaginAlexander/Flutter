import 'package:flutter/material.dart'; // Подключаем библиотеку или файл.
import '../widgets/text_field.dart'; // Подключаем библиотеку или файл.
import 'login_page.dart'; // Подключаем библиотеку или файл.

class ProfilePage extends StatefulWidget { // Объявляем класс.
  const ProfilePage({super.key}); // Продолжаем описание элемента.

  @override // Переопределяем унаследованный метод.
  State<ProfilePage> createState() => _ProfilePageState(); // Продолжаем описание элемента.
} // Закрываем блок.

class _ProfilePageState extends State<ProfilePage> { // Объявляем класс.
  final _formKey = GlobalKey<FormState>(); // Создаём ключ для доступа к форме.
  final _nameController = TextEditingController(text: 'Иванов Иван Иванович'); // Работаем с контроллером текста.
  final _emailController = TextEditingController(text: 'test123@mail.ru'); // Работаем с контроллером текста.
  final _passwordController = TextEditingController(); // Работаем с контроллером текста.
  final _confirmController = TextEditingController(); // Работаем с контроллером текста.

  @override // Переопределяем унаследованный метод.
  void dispose() { // Освобождаем ресурсы.
    _nameController.dispose(); // Освобождаем ресурсы.
    _emailController.dispose(); // Освобождаем ресурсы.
    _passwordController.dispose(); // Освобождаем ресурсы.
    _confirmController.dispose(); // Освобождаем ресурсы.
    super.dispose(); // Освобождаем ресурсы.
  } // Закрываем блок.

  void _save() { // Продолжаем описание элемента.
    if (_formKey.currentState?.validate() ?? false) { // Проверяем данные формы.
      FocusScope.of(context).unfocus(); // Снимаем фокус с поля ввода.
      ScaffoldMessenger.of(context).showSnackBar( // Обращаемся к сообщениям экрана.
        const SnackBar(content: Text('Профиль сохранён')), // Показываем всплывающее сообщение.
      ); // Завершаем описание элемента.
    } // Закрываем блок.
  } // Закрываем блок.

  @override // Переопределяем унаследованный метод.
  Widget build(BuildContext context) { // Строим интерфейс.
    return Scaffold( // Возвращаем результат.
      backgroundColor: const Color(0xFFF1F8E9), // Задаём цвет.
      body: SafeArea( // Задаём параметр.
        child: SingleChildScrollView( // Задаём дочерний виджет.
          padding: const EdgeInsets.all(24), // Задаём параметр.
          child: Form( // Задаём дочерний виджет.
            key: _formKey, // Задаём параметр.
            child: Column( // Задаём дочерний виджет.
              children: [ // Перечисляем дочерние виджеты.
                Row( // Продолжаем описание элемента.
                  children: [ // Перечисляем дочерние виджеты.
                    IconButton( // Продолжаем описание элемента.
                      icon: const Icon(Icons.arrow_back_ios_new), // Задаём параметр.
                      onPressed: () => Navigator.of(context).pushReplacement( // Переходим между экранами.
                        MaterialPageRoute(builder: (_) => const LoginPage()), // Создаём маршрут к экрану.
                      ), // Завершаем описание элемента.
                    ), // Завершаем описание элемента.
                    const Expanded( // Продолжаем описание элемента.
                      child: Text( // Задаём дочерний виджет.
                        'Профиль', // Продолжаем описание элемента.
                        textAlign: TextAlign.center, // Задаём параметр.
                        style: TextStyle( // Настраиваем стиль текста.
                            fontSize: 28, fontWeight: FontWeight.bold), // Задаём параметр.
                      ), // Завершаем описание элемента.
                    ), // Завершаем описание элемента.
                    const SizedBox(width: 48), // Задаём размер или отступ.
                  ], // Завершаем описание элемента.
                ), // Завершаем описание элемента.
                const SizedBox(height: 16), // Задаём размер или отступ.
                ClipRRect( // Продолжаем описание элемента.
                  borderRadius: BorderRadius.circular(28), // Задаём параметр.
                  child: Container( // Задаём дочерний виджет.
                    width: 120, // Задаём параметр.
                    height: 120, // Задаём параметр.
                    color: Colors.white, // Задаём параметр.
                    padding: const EdgeInsets.all(12), // Задаём параметр.
                    child: Image.asset('assets/images/avatar.png'), // Задаём дочерний виджет.
                  ), // Завершаем описание элемента.
                ), // Завершаем описание элемента.
                const SizedBox(height: 24), // Задаём размер или отступ.
                CustomTextFormField( // Используем собственное поле ввода.
                  inputType: InputFieldType.name, // Указываем тип поля.
                  labelText: 'ФИО', // Задаём подпись поля.
                  hintText: 'Иванов Иван Иванович', // Задаём подсказку.
                  prefixIcon: Icons.person_outline, // Задаём значок поля.
                  controller: _nameController, // Передаём контроллер поля.
                ), // Завершаем описание элемента.
                const SizedBox(height: 14), // Задаём размер или отступ.
                CustomTextFormField( // Используем собственное поле ввода.
                  inputType: InputFieldType.email, // Указываем тип поля.
                  labelText: 'Email', // Задаём подпись поля.
                  hintText: 'example@mail.com', // Задаём подсказку.
                  prefixIcon: Icons.email_outlined, // Задаём значок поля.
                  controller: _emailController, // Передаём контроллер поля.
                ), // Завершаем описание элемента.
                const SizedBox(height: 14), // Задаём размер или отступ.
                CustomTextFormField( // Используем собственное поле ввода.
                  inputType: InputFieldType.password, // Указываем тип поля.
                  labelText: 'Пароль', // Задаём подпись поля.
                  hintText: 'Не менее 6 символов', // Задаём подсказку.
                  prefixIcon: Icons.shield_outlined, // Задаём значок поля.
                  controller: _passwordController, // Передаём контроллер поля.
                ), // Завершаем описание элемента.
                const SizedBox(height: 14), // Задаём размер или отступ.
                CustomTextFormField( // Используем собственное поле ввода.
                  inputType: InputFieldType.confirmPassword, // Указываем тип поля.
                  labelText: 'Повторите пароль', // Задаём подпись поля.
                  hintText: 'Повторите пароль', // Задаём подсказку.
                  prefixIcon: Icons.shield_outlined, // Задаём значок поля.
                  controller: _confirmController, // Передаём контроллер поля.
                  compareWith: _passwordController, // Передаём контроллер для сравнения паролей.
                  isLast: true, // Отмечаем последнее поле.
                ), // Завершаем описание элемента.
                const SizedBox(height: 24), // Задаём размер или отступ.
                SizedBox( // Задаём размер или отступ.
                  width: 220, // Задаём параметр.
                  height: 52, // Задаём параметр.
                  child: ElevatedButton( // Задаём дочерний виджет.
                    onPressed: _save, // Задаём обработчик нажатия.
                    style: ElevatedButton.styleFrom( // Задаём параметр.
                      backgroundColor: const Color(0xFF558B2F), // Задаём цвет.
                      foregroundColor: Colors.white, // Задаём параметр.
                      shape: RoundedRectangleBorder( // Задаём параметр.
                        borderRadius: BorderRadius.circular(28), // Задаём параметр.
                      ), // Завершаем описание элемента.
                    ), // Завершаем описание элемента.
                    child: // Задаём дочерний виджет.
                        const Text('Сохранить', style: TextStyle(fontSize: 18)), // Настраиваем стиль текста.
                  ), // Завершаем описание элемента.
                ), // Завершаем описание элемента.
              ], // Завершаем описание элемента.
            ), // Завершаем описание элемента.
          ), // Завершаем описание элемента.
        ), // Завершаем описание элемента.
      ), // Завершаем описание элемента.
    ); // Завершаем описание элемента.
  } // Закрываем блок.
} // Закрываем блок.

void main() { // Продолжаем описание элемента.
  runApp(const MaterialApp( // Запускаем приложение.
    debugShowCheckedModeBanner: false, // Задаём параметр.
    home: ProfilePage(), // Задаём параметр.
  )); // Завершаем описание элемента.
} // Закрываем блок.

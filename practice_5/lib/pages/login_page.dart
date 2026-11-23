import 'package:flutter/material.dart'; // Подключаем библиотеку или файл.
import '../widgets/text_field.dart'; // Подключаем библиотеку или файл.
import 'profile_page.dart'; // Подключаем библиотеку или файл.
import 'register_page.dart'; // Подключаем библиотеку или файл.

class LoginPage extends StatefulWidget { // Объявляем класс.
  const LoginPage({super.key}); // Продолжаем описание элемента.

  @override // Переопределяем унаследованный метод.
  State<LoginPage> createState() => _LoginPageState(); // Продолжаем описание элемента.
} // Закрываем блок.

class _LoginPageState extends State<LoginPage> { // Объявляем класс.
  final _formKey = GlobalKey<FormState>(); // Создаём ключ для доступа к форме.
  final _emailController = TextEditingController(); // Работаем с контроллером текста.
  final _passwordController = TextEditingController(); // Работаем с контроллером текста.

  @override // Переопределяем унаследованный метод.
  void dispose() { // Освобождаем ресурсы.
    _emailController.dispose(); // Освобождаем ресурсы.
    _passwordController.dispose(); // Освобождаем ресурсы.
    super.dispose(); // Освобождаем ресурсы.
  } // Закрываем блок.

  void _submit() { // Продолжаем описание элемента.
    if (_formKey.currentState?.validate() ?? false) { // Проверяем данные формы.
      FocusScope.of(context).unfocus(); // Снимаем фокус с поля ввода.
      Navigator.of(context).pushReplacement( // Переходим между экранами.
        MaterialPageRoute(builder: (_) => const ProfilePage()), // Создаём маршрут к экрану.
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
              crossAxisAlignment: CrossAxisAlignment.start, // Задаём параметр.
              children: [ // Перечисляем дочерние виджеты.
                const SizedBox(height: 40), // Задаём размер или отступ.
                const Icon(Icons.lock_open_rounded, // Продолжаем описание элемента.
                    size: 56, color: Color(0xFF558B2F)), // Задаём цвет.
                const SizedBox(height: 16), // Задаём размер или отступ.
                const Text( // Продолжаем описание элемента.
                  'Добро пожаловать!', // Продолжаем описание элемента.
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold), // Настраиваем стиль текста.
                ), // Завершаем описание элемента.
                const SizedBox(height: 6), // Задаём размер или отступ.
                const Text( // Продолжаем описание элемента.
                  'Войдите в свой аккаунт или создайте новый', // Продолжаем описание элемента.
                  style: TextStyle(fontSize: 16, color: Colors.black54), // Настраиваем стиль текста.
                ), // Завершаем описание элемента.
                const SizedBox(height: 32), // Задаём размер или отступ.
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
                  isLast: true, // Отмечаем последнее поле.
                ), // Завершаем описание элемента.
                Align( // Продолжаем описание элемента.
                  alignment: Alignment.centerRight, // Задаём параметр.
                  child: TextButton( // Задаём дочерний виджет.
                    onPressed: () {}, // Задаём обработчик нажатия.
                    child: const Text('Забыли пароль?'), // Задаём дочерний виджет.
                  ), // Завершаем описание элемента.
                ), // Завершаем описание элемента.
                const SizedBox(height: 16), // Задаём размер или отступ.
                SizedBox( // Задаём размер или отступ.
                  width: double.infinity, // Задаём параметр.
                  height: 52, // Задаём параметр.
                  child: ElevatedButton( // Задаём дочерний виджет.
                    onPressed: _submit, // Задаём обработчик нажатия.
                    style: ElevatedButton.styleFrom( // Задаём параметр.
                      backgroundColor: const Color(0xFF558B2F), // Задаём цвет.
                      foregroundColor: Colors.white, // Задаём параметр.
                      shape: RoundedRectangleBorder( // Задаём параметр.
                        borderRadius: BorderRadius.circular(28), // Задаём параметр.
                      ), // Завершаем описание элемента.
                    ), // Завершаем описание элемента.
                    child: const Text('Войти', style: TextStyle(fontSize: 18)), // Настраиваем стиль текста.
                  ), // Завершаем описание элемента.
                ), // Завершаем описание элемента.
                const SizedBox(height: 40), // Задаём размер или отступ.
                Center( // Продолжаем описание элемента.
                  child: Wrap( // Задаём дочерний виджет.
                    crossAxisAlignment: WrapCrossAlignment.center, // Задаём параметр.
                    children: [ // Перечисляем дочерние виджеты.
                      const Text('Нет аккаунта? '), // Продолжаем описание элемента.
                      GestureDetector( // Продолжаем описание элемента.
                        onTap: () => Navigator.of(context).push( // Переходим между экранами.
                          MaterialPageRoute( // Создаём маршрут к экрану.
                              builder: (_) => const RegisterPage()), // Задаём параметр.
                        ), // Завершаем описание элемента.
                        child: const Text( // Задаём дочерний виджет.
                          'Зарегистрируйтесь', // Продолжаем описание элемента.
                          style: TextStyle( // Настраиваем стиль текста.
                            fontWeight: FontWeight.bold, // Задаём параметр.
                            color: Color(0xFF33691E), // Задаём цвет.
                          ), // Завершаем описание элемента.
                        ), // Завершаем описание элемента.
                      ), // Завершаем описание элемента.
                    ], // Завершаем описание элемента.
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
    home: LoginPage(), // Задаём параметр.
  )); // Завершаем описание элемента.
} // Закрываем блок.

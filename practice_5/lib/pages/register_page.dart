import 'package:flutter/material.dart'; // Подключаем библиотеку или файл.
import '../widgets/text_field.dart'; // Подключаем библиотеку или файл.
import 'login_page.dart'; // Подключаем библиотеку или файл.

class RegisterPage extends StatefulWidget { // Объявляем класс.
  const RegisterPage({super.key}); // Продолжаем описание элемента.

  @override // Переопределяем унаследованный метод.
  State<RegisterPage> createState() => _RegisterPageState(); // Продолжаем описание элемента.
} // Закрываем блок.

class _RegisterPageState extends State<RegisterPage> { // Объявляем класс.
  final _formKey = GlobalKey<FormState>(); // Создаём ключ для доступа к форме.
  final _nameController = TextEditingController(); // Работаем с контроллером текста.
  final _emailController = TextEditingController(); // Работаем с контроллером текста.
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

  void _submit() { // Продолжаем описание элемента.
    if (_formKey.currentState?.validate() ?? false) { // Проверяем данные формы.
      FocusScope.of(context).unfocus(); // Снимаем фокус с поля ввода.
      ScaffoldMessenger.of(context).showSnackBar( // Обращаемся к сообщениям экрана.
        const SnackBar(content: Text('Регистрация прошла успешно')), // Показываем всплывающее сообщение.
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
                const SizedBox(height: 40), // Задаём размер или отступ.
                const Text( // Продолжаем описание элемента.
                  'Регистрация', // Продолжаем описание элемента.
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), // Настраиваем стиль текста.
                ), // Завершаем описание элемента.
                const SizedBox(height: 28), // Задаём размер или отступ.
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
                const SizedBox(height: 28), // Задаём размер или отступ.
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
                    child: const Text('Зарегистрироваться', // Задаём дочерний виджет.
                        style: TextStyle(fontSize: 18)), // Настраиваем стиль текста.
                  ), // Завершаем описание элемента.
                ), // Завершаем описание элемента.
                const SizedBox(height: 28), // Задаём размер или отступ.
                Wrap( // Продолжаем описание элемента.
                  crossAxisAlignment: WrapCrossAlignment.center, // Задаём параметр.
                  children: [ // Перечисляем дочерние виджеты.
                    const Text('Уже есть аккаунт? '), // Продолжаем описание элемента.
                    GestureDetector( // Продолжаем описание элемента.
                      onTap: () => Navigator.of(context).pushReplacement( // Переходим между экранами.
                        MaterialPageRoute(builder: (_) => const LoginPage()), // Создаём маршрут к экрану.
                      ), // Завершаем описание элемента.
                      child: const Text( // Задаём дочерний виджет.
                        'Войдите', // Продолжаем описание элемента.
                        style: TextStyle( // Настраиваем стиль текста.
                          fontWeight: FontWeight.bold, // Задаём параметр.
                          color: Color(0xFF33691E), // Задаём цвет.
                        ), // Завершаем описание элемента.
                      ), // Завершаем описание элемента.
                    ), // Завершаем описание элемента.
                  ], // Завершаем описание элемента.
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
    home: RegisterPage(), // Задаём параметр.
  )); // Завершаем описание элемента.
} // Закрываем блок.

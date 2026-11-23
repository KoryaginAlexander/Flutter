import 'package:flutter/material.dart'; // Подключаем библиотеку или файл.

// Тип поля определяет правила валидации и поведение
enum InputFieldType { name, email, password, confirmPassword } // Перечисляем типы полей.

class CustomTextFormField extends StatefulWidget { // Объявляем класс.
  final InputFieldType inputType; // Указываем тип поля.
  final String labelText; // Продолжаем описание элемента.
  final String hintText; // Продолжаем описание элемента.
  final IconData prefixIcon; // Продолжаем описание элемента.
  final TextEditingController controller; // Работаем с контроллером текста.

  // Контроллер пароля, с которым сравнивается подтверждение пароля
  final TextEditingController? compareWith; // Работаем с контроллером текста.
  final bool isLast; // Продолжаем описание элемента.

  const CustomTextFormField({ // Используем собственное поле ввода.
    super.key, // Продолжаем описание элемента.
    required this.inputType, // Продолжаем описание элемента.
    required this.labelText, // Продолжаем описание элемента.
    required this.hintText, // Продолжаем описание элемента.
    required this.prefixIcon, // Продолжаем описание элемента.
    required this.controller, // Продолжаем описание элемента.
    this.compareWith, // Продолжаем описание элемента.
    this.isLast = false, // Продолжаем описание элемента.
  }); // Закрываем блок.

  @override // Переопределяем унаследованный метод.
  State<CustomTextFormField> createState() => _CustomTextFormFieldState(); // Используем собственное поле ввода.
} // Закрываем блок.

class _CustomTextFormFieldState extends State<CustomTextFormField> { // Объявляем класс.
  bool _obscure = true; // Продолжаем описание элемента.

  bool get _isPassword => // Продолжаем описание элемента.
      widget.inputType == InputFieldType.password || // Указываем тип поля.
      widget.inputType == InputFieldType.confirmPassword; // Указываем тип поля.

  // Регулярные выражения для проверки значений
  static final RegExp _nameReg = RegExp(r'^[A-Za-zА-Яа-яЁё\s]+$'); // Задаём регулярное выражение.
  static final RegExp _emailReg = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$'); // Задаём регулярное выражение.
  static final RegExp _passReg = // Задаём регулярное выражение.
      RegExp(r'^(?=.*[A-Za-zА-Яа-яЁё])(?=.*\d)(?=.*[+_\-]).{6,}$'); // Задаём регулярное выражение.

  String? _validate(String? value) { // Продолжаем описание элемента.
    if (value == null || value.trim().isEmpty) { // Проверяем условие.
      return 'Поле не может быть пустым'; // Возвращаем результат.
    } // Закрываем блок.
    switch (widget.inputType) { // Выбираем вариант.
      case InputFieldType.name: // Указываем тип поля.
        if (!_nameReg.hasMatch(value)) { // Проверяем условие.
          return 'ФИО может содержать только буквы и пробелы'; // Возвращаем результат.
        } // Закрываем блок.
        return null; // Возвращаем результат.
      case InputFieldType.email: // Указываем тип поля.
        if (!_emailReg.hasMatch(value)) { // Проверяем условие.
          return 'Введите корректный email (например, name@mail.ru)'; // Возвращаем результат.
        } // Закрываем блок.
        return null; // Возвращаем результат.
      case InputFieldType.password: // Указываем тип поля.
        if (!_passReg.hasMatch(value)) { // Проверяем условие.
          return 'Не менее 6 символов: буквы, цифры и символ (+, _, -)'; // Возвращаем результат.
        } // Закрываем блок.
        return null; // Возвращаем результат.
      case InputFieldType.confirmPassword: // Указываем тип поля.
        if (value != widget.compareWith?.text) { // Проверяем условие.
          return 'Пароли не совпадают'; // Возвращаем результат.
        } // Закрываем блок.
        return null; // Возвращаем результат.
    } // Закрываем блок.
  } // Закрываем блок.

  TextInputType get _keyboard { // Продолжаем описание элемента.
    switch (widget.inputType) { // Выбираем вариант.
      case InputFieldType.email: // Указываем тип поля.
        return TextInputType.emailAddress; // Возвращаем результат.
      case InputFieldType.name: // Указываем тип поля.
        return TextInputType.name; // Возвращаем результат.
      default: // Задаём параметр.
        return TextInputType.visiblePassword; // Возвращаем результат.
    } // Закрываем блок.
  } // Закрываем блок.

  OutlineInputBorder _border(Color color, double width) { // Продолжаем описание элемента.
    return OutlineInputBorder( // Возвращаем результат.
      borderRadius: BorderRadius.circular(28), // Задаём параметр.
      borderSide: BorderSide(color: color, width: width), // Задаём параметр.
    ); // Завершаем описание элемента.
  } // Закрываем блок.

  @override // Переопределяем унаследованный метод.
  Widget build(BuildContext context) { // Строим интерфейс.
    return TextFormField( // Возвращаем результат.
      controller: widget.controller, // Передаём контроллер поля.
      obscureText: _isPassword && _obscure, // Настраиваем скрытие текста.
      keyboardType: _keyboard, // Выбираем тип клавиатуры.
      // Переход фокуса к следующему полю
      textInputAction: // Задаём параметр.
          widget.isLast ? TextInputAction.done : TextInputAction.next, // Задаём параметр.
      onEditingComplete: () { // Задаём параметр.
        if (widget.isLast) { // Проверяем условие.
          FocusScope.of(context).unfocus(); // Снимаем фокус с поля ввода.
        } else { // Закрываем блок.
          FocusScope.of(context).nextFocus(); // Продолжаем описание элемента.
        } // Закрываем блок.
      }, // Закрываем блок.
      validator: _validate, // Подключаем проверку ввода.
      decoration: InputDecoration( // Задаём параметр.
        labelText: widget.labelText, // Задаём подпись поля.
        hintText: widget.hintText, // Задаём подсказку.
        filled: true, // Задаём параметр.
        fillColor: Colors.white, // Задаём параметр.
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16), // Задаём параметр.
        prefixIcon: Icon(widget.prefixIcon, color: const Color(0xFF558B2F)), // Задаём значок поля.
        // ExcludeFocus: иконка не участвует в переходе фокуса между полями
        suffixIcon: _isPassword // Задаём параметр.
            ? ExcludeFocus( // Продолжаем описание элемента.
                child: IconButton( // Задаём дочерний виджет.
                  icon: // Задаём параметр.
                      Icon(_obscure ? Icons.visibility_off : Icons.visibility), // Задаём параметр.
                  onPressed: () => setState(() => _obscure = !_obscure), // Задаём обработчик нажатия.
                ), // Завершаем описание элемента.
              ) // Завершаем описание элемента.
            : null, // Задаём параметр.
        border: _border(Colors.grey, 1), // Задаём параметр.
        enabledBorder: _border(Colors.grey.shade400, 1), // Задаём параметр.
        focusedBorder: _border(const Color(0xFF7CB342), 2), // Задаём цвет.
        errorBorder: _border(Colors.red, 1.5), // Задаём параметр.
        focusedErrorBorder: _border(Colors.red, 2), // Задаём параметр.
      ), // Завершаем описание элемента.
    ); // Завершаем описание элемента.
  } // Закрываем блок.
} // Закрываем блок.

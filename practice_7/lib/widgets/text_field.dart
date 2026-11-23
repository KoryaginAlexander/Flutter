import 'package:flutter/material.dart';

// Тип поля определяет правила валидации и поведение
enum InputFieldType { name, email, password, confirmPassword }

class CustomTextFormField extends StatefulWidget {
  final InputFieldType inputType;
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;

  // Контроллер пароля, с которым сравнивается подтверждение пароля
  final TextEditingController? compareWith;
  final bool isLast;

  const CustomTextFormField({
    super.key,
    required this.inputType,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.compareWith,
    this.isLast = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscure = true;

  bool get _isPassword =>
      widget.inputType == InputFieldType.password ||
      widget.inputType == InputFieldType.confirmPassword;

  // Регулярные выражения для проверки значений
  static final RegExp _nameReg = RegExp(r'^[A-Za-zА-Яа-яЁё\s]+$');
  static final RegExp _emailReg = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  static final RegExp _passReg =
      RegExp(r'^(?=.*[A-Za-zА-Яа-яЁё])(?=.*\d)(?=.*[+_\-]).{6,}$');

  String? _validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Поле не может быть пустым';
    }
    switch (widget.inputType) {
      case InputFieldType.name:
        if (!_nameReg.hasMatch(value)) {
          return 'ФИО может содержать только буквы и пробелы';
        }
        return null;
      case InputFieldType.email:
        if (!_emailReg.hasMatch(value)) {
          return 'Введите корректный email (например, name@mail.ru)';
        }
        return null;
      case InputFieldType.password:
        if (!_passReg.hasMatch(value)) {
          return 'Не менее 6 символов: буквы, цифры и символ (+, _, -)';
        }
        return null;
      case InputFieldType.confirmPassword:
        if (value != widget.compareWith?.text) {
          return 'Пароли не совпадают';
        }
        return null;
    }
  }

  TextInputType get _keyboard {
    switch (widget.inputType) {
      case InputFieldType.email:
        return TextInputType.emailAddress;
      case InputFieldType.name:
        return TextInputType.name;
      default:
        return TextInputType.visiblePassword;
    }
  }

  OutlineInputBorder _border(Color color, double width) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isPassword && _obscure,
      keyboardType: _keyboard,
      // Переход фокуса к следующему полю
      textInputAction:
          widget.isLast ? TextInputAction.done : TextInputAction.next,
      onEditingComplete: () {
        if (widget.isLast) {
          FocusScope.of(context).unfocus();
        } else {
          FocusScope.of(context).nextFocus();
        }
      },
      validator: _validate,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        prefixIcon: Icon(widget.prefixIcon, color: const Color(0xFF558B2F)),
        // ExcludeFocus: иконка не участвует в переходе фокуса между полями
        suffixIcon: _isPassword
            ? ExcludeFocus(
                child: IconButton(
                  icon:
                      Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
              )
            : null,
        border: _border(Colors.grey, 1),
        enabledBorder: _border(Colors.grey.shade400, 1),
        focusedBorder: _border(const Color(0xFF7CB342), 2),
        errorBorder: _border(Colors.red, 1.5),
        focusedErrorBorder: _border(Colors.red, 2),
      ),
    );
  }
}

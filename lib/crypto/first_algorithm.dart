import 'package:dbcrypt/dbcrypt.dart';

class HashedPassword {
  String hash;
  String salt;

  HashedPassword(this.hash, this.salt);
}

HashedPassword hashPassword(String password) {
  final salt = DBCrypt().gensalt();
  final hash = DBCrypt().hashpw(password, salt);
  return HashedPassword(hash, salt);
}

bool verifyPassword(String password, HashedPassword hashedPassword) {
  final hashed = DBCrypt().hashpw(password, hashedPassword.salt);
  return hashed == hashedPassword.hash;
}

void main() {
  final password = 'secretpassword';

  // Registro de usuario
  final hashedPassword = hashPassword(password);

  print('Contraseña original: $password');
  print('Salt: ${hashedPassword.salt}');
  print('Contraseña encriptada: ${hashedPassword.hash}');

  // Simulación de inicio de sesión
  final inputPassword = 'secretpassword';
  final passwordMatch = verifyPassword(inputPassword, hashedPassword);

  if (passwordMatch) {
    print('Contraseña correcta. ¡Inicio de sesión exitoso!');
  } else {
    print('Contraseña incorrecta. Inicio de sesión fallido.');
  }
}

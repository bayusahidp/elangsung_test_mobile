part of 'shared.dart';

class EncryptDecrypt {
  static String encryptData(value) {
    final key = Key.fromUtf8('i0ewjbcpou2euf90213c8r8023r7bycq');
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(value, iv: iv);

    return encrypted.base64;
  }

  static String decryptData(value) {
    final key = Key.fromUtf8('i0ewjbcpou2euf90213c8r8023r7bycq');
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decrypt(Encrypted.from64(value), iv: iv);

    return decrypted;
  }
}
// // import 'package:encrypt/encrypt.dart' as encrypt;
// import 'package:crypto/crypto.dart';

// class EncryptData{
// //for AES Algorithms

//   static Encrypted? encrypted;
//   static var decrypted;

//   static encryptAES(plainText){
//     final key = Key.fromUtf8('my 32 length key................');
//     final iv = IV.fromLength(16);
//     final encrypter = Encrypter(AES(key));
//       encrypted = encrypter.encrypt(plainText, iv: iv);
//     print(encrypted!.base64);
//   }

//   static decryptAES(plainText){
//     final key = Key.fromUtf8('my 32 length key................');
//     final iv = IV.fromLength(16);
//     final encrypter = Encrypter(AES(key));
//     decrypted = encrypter.decrypt(encrypted!, iv: iv);
//     print(decrypted);
//   }
// }

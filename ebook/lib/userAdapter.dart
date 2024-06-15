import 'package:hive/hive.dart';
import 'model/user.dart'; 

class UserAdapter extends TypeAdapter<User> {
  // menyimpan dan mengambil objek User dari database Hive
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    return User(
      name: reader.read(),
      username: reader.read(),
      password: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.write(obj.name);
    writer.write(obj.username);
    writer.write(obj.password);
  }
}

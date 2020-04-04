import 'package:moor/moor.dart';
import 'dart:io';
import 'package:moor_ffi/moor_ffi.dart';
//import 'package:encrypted_moor/encrypted_moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'moor.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(()async{
    final dbDirectory = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbDirectory.path, 'db.sqlite'));

    return VmDatabase(file);
  });
}


class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().withLength(min: 7, max: 50)();
  TextColumn get password => text().withLength(min: 7, max: 100)();
}

@UseMoor(tables: [Users], daos: [UserDao])
class AppDB extends _$AppDB {
  AppDB() : super(_openConnection());

  @override
  int get schemaVersion => 4;
}

@UseDao(tables: [Users])
class UserDao extends DatabaseAccessor<AppDB> with _$UserDaoMixin {
  final AppDB db;

  UserDao(this.db) : super(db);

  Future<List<User>> getByUsername(String username) {
    print("username" +username);
    return (select(users)
      ..where((u) => u.username.like('%$username%'))
      ..limit(3)).get();
  }

  Future<List<User>> getAll() {
    return select(users).get();
  }

  Future updateTask(Insertable<User> user) => update(users).replace(user);
  Future deleteTask(Insertable<User> user) => delete(users).delete(user);

  Future postUser(formData) => into(users).insert(formData);
}
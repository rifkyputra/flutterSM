import 'package:moor/moor.dart';
import 'dart:io';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
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
  TextColumn get id => text().withDefault(Constant(Uuid().v1()))();
  TextColumn get username => text().withLength(min: 7, max: 50).customConstraint('UNIQUE')();
  TextColumn get password => text().withLength(min: 7, max: 100)();
}

class Employees extends Table {
  TextColumn get id => text().withDefault(Constant(Uuid().v1()))();
  TextColumn get name => text().withLength(min:3, max: 45)();
  TextColumn get gender => text().withLength(min:3, max: 12).nullable()();
  TextColumn get bloodType => text().withLength(min:1, max: 5).nullable()();
  TextColumn get imgUrl => text().withLength(min:5, max: 96).nullable()();
  TextColumn get phoneNum => text().withLength(min:8, max: 18).nullable()();
  TextColumn get address => text().withLength(min:5, max: 96).nullable()();
  TextColumn get birthPlace => text().withLength(min:5, max: 30).nullable()();
  TextColumn get birthDate => text().withLength(min:5, max: 18).nullable()();
  TextColumn get identity => text().withLength(min:3, max: 18).nullable()();
  TextColumn get distantRelative => text().withLength(min:3, max: 96).nullable()();
  TextColumn get place => text().withLength(min:3, max: 96).nullable()();
}

class Attendances extends Table {
  TextColumn get id => text().withDefault(Constant(Uuid().v1()))();
  TextColumn get employeeName => text()();
  TextColumn get enterAt => text().nullable()();
  TextColumn get outAt => text().nullable()();
  TextColumn get date => text()();
  TextColumn get site => text()();
  TextColumn get sync => text()();
}

class Sites extends Table {
  TextColumn get id => text().withDefault(Constant(Uuid().v1()))();
  TextColumn get siteName => text()();
  TextColumn get aliasName => text()();
  TextColumn get location => text()();
}

@UseMoor(tables: [Users, Employees, Attendances, Sites], daos: [UserDao])
class AppDB extends _$AppDB {
  AppDB() : super(_openConnection());

  @override
  int get schemaVersion => 7;
}

@UseDao(tables: [Users, Employees, Attendances, Sites])
class UserDao extends DatabaseAccessor<AppDB> with _$UserDaoMixin {
  final AppDB db;

  UserDao(this.db) : super(db);

  //
  // Attendance
  //
  Future<List<Attendance>> getAllAttendance() {
    return select(attendances).get();
  }

  Future<List<Attendance>> getAttendanceBySite(siteName) {
    return (select(attendances)
      ..where((att) => att.site.equals(siteName.trim()))
    ).get();
  }

  Future<List<Attendance>> getAttendanceByName(employeeName) {
    return (select(attendances)
        ..where((att) => att.employeeName.equals(employeeName))
    ).get();
  }

  Future createNew(attData) {
    return into(attendances).insert(attData);
  }
  
  Future<List> getAttendanceNotSynced() {
    return (select(attendances)
      ..where((att) => att.sync.equals("no"))
    ).get();
  }

  /*
  // Attendance
  */

  /*
  // Site
  */
  Future getAllSite() => select(sites).get();
  /*
  // Site
  */


  /*
  //User
   */
  Future<List<User>> getByUsername(String username) {
    return (select(users)
      ..where((u) => u.username.equals(username.trim()))
      ..limit(3)).get();
  }
  Future<List<User>> getAll() {
    return select(users).get();
  }

  Future updateTask(Insertable<User> user) => update(users).replace(user);
  Future deleteTask(Insertable<User> user) => delete(users).delete(user);

  Future postUser(formData) {
    User userTrimmed = User(username: formData.username.toString().trim(), password: formData.password.toString().trim());
    return into(users).insert(userTrimmed);

  }
  /*
  // User
   */

  /*
  // Employee
   */
  Future getAllEmployee() => select(employees).get();

  Future getEmployeeByID(id) {
    return (select(employees) 
      ..where((em) => em.id.equals(id))
    ).get();
  }
  
  /*
  // Employee
   */
}
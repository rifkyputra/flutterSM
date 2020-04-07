// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final String id;
  final String username;
  final String password;
  User({@required this.id, @required this.username, @required this.password});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return User(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      username: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}username']),
      password: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}password']),
    );
  }
  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
    };
  }

  @override
  UsersCompanion createCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
    );
  }

  User copyWith({String id, String username, String password}) => User(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(username.hashCode, password.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.username == this.username &&
          other.password == this.password);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> username;
  final Value<String> password;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    @required String username,
    @required String password,
  })  : username = Value(username),
        password = Value(password);
  UsersCompanion copyWith(
      {Value<String> id, Value<String> username, Value<String> password}) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false,
        defaultValue: Constant(Uuid().v1()));
  }

  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  GeneratedTextColumn _username;
  @override
  GeneratedTextColumn get username => _username ??= _constructUsername();
  GeneratedTextColumn _constructUsername() {
    return GeneratedTextColumn('username', $tableName, false,
        minTextLength: 7, maxTextLength: 50, $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  GeneratedTextColumn _password;
  @override
  GeneratedTextColumn get password => _password ??= _constructPassword();
  GeneratedTextColumn _constructPassword() {
    return GeneratedTextColumn('password', $tableName, false,
        minTextLength: 7, maxTextLength: 100);
  }

  @override
  List<GeneratedColumn> get $columns => [id, username, password];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(UsersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.username.present) {
      context.handle(_usernameMeta,
          username.isAcceptableValue(d.username.value, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (d.password.present) {
      context.handle(_passwordMeta,
          password.isAcceptableValue(d.password.value, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(UsersCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.username.present) {
      map['username'] = Variable<String, StringType>(d.username.value);
    }
    if (d.password.present) {
      map['password'] = Variable<String, StringType>(d.password.value);
    }
    return map;
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

class Employee extends DataClass implements Insertable<Employee> {
  final String id;
  final String name;
  final String gender;
  final String bloodType;
  final String imgUrl;
  final String phoneNum;
  final String address;
  final String birthPlace;
  final String birthDate;
  final String identity;
  final String distantRelative;
  final String place;
  Employee(
      {@required this.id,
      @required this.name,
      this.gender,
      this.bloodType,
      this.imgUrl,
      this.phoneNum,
      this.address,
      this.birthPlace,
      this.birthDate,
      this.identity,
      this.distantRelative,
      this.place});
  factory Employee.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Employee(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      gender:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}gender']),
      bloodType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}blood_type']),
      imgUrl:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}img_url']),
      phoneNum: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}phone_num']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      birthPlace: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}birth_place']),
      birthDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}birth_date']),
      identity: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}identity']),
      distantRelative: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}distant_relative']),
      place:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}place']),
    );
  }
  factory Employee.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Employee(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      gender: serializer.fromJson<String>(json['gender']),
      bloodType: serializer.fromJson<String>(json['bloodType']),
      imgUrl: serializer.fromJson<String>(json['imgUrl']),
      phoneNum: serializer.fromJson<String>(json['phoneNum']),
      address: serializer.fromJson<String>(json['address']),
      birthPlace: serializer.fromJson<String>(json['birthPlace']),
      birthDate: serializer.fromJson<String>(json['birthDate']),
      identity: serializer.fromJson<String>(json['identity']),
      distantRelative: serializer.fromJson<String>(json['distantRelative']),
      place: serializer.fromJson<String>(json['place']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'gender': serializer.toJson<String>(gender),
      'bloodType': serializer.toJson<String>(bloodType),
      'imgUrl': serializer.toJson<String>(imgUrl),
      'phoneNum': serializer.toJson<String>(phoneNum),
      'address': serializer.toJson<String>(address),
      'birthPlace': serializer.toJson<String>(birthPlace),
      'birthDate': serializer.toJson<String>(birthDate),
      'identity': serializer.toJson<String>(identity),
      'distantRelative': serializer.toJson<String>(distantRelative),
      'place': serializer.toJson<String>(place),
    };
  }

  @override
  EmployeesCompanion createCompanion(bool nullToAbsent) {
    return EmployeesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      bloodType: bloodType == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodType),
      imgUrl:
          imgUrl == null && nullToAbsent ? const Value.absent() : Value(imgUrl),
      phoneNum: phoneNum == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNum),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      birthPlace: birthPlace == null && nullToAbsent
          ? const Value.absent()
          : Value(birthPlace),
      birthDate: birthDate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthDate),
      identity: identity == null && nullToAbsent
          ? const Value.absent()
          : Value(identity),
      distantRelative: distantRelative == null && nullToAbsent
          ? const Value.absent()
          : Value(distantRelative),
      place:
          place == null && nullToAbsent ? const Value.absent() : Value(place),
    );
  }

  Employee copyWith(
          {String id,
          String name,
          String gender,
          String bloodType,
          String imgUrl,
          String phoneNum,
          String address,
          String birthPlace,
          String birthDate,
          String identity,
          String distantRelative,
          String place}) =>
      Employee(
        id: id ?? this.id,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        bloodType: bloodType ?? this.bloodType,
        imgUrl: imgUrl ?? this.imgUrl,
        phoneNum: phoneNum ?? this.phoneNum,
        address: address ?? this.address,
        birthPlace: birthPlace ?? this.birthPlace,
        birthDate: birthDate ?? this.birthDate,
        identity: identity ?? this.identity,
        distantRelative: distantRelative ?? this.distantRelative,
        place: place ?? this.place,
      );
  @override
  String toString() {
    return (StringBuffer('Employee(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('gender: $gender, ')
          ..write('bloodType: $bloodType, ')
          ..write('imgUrl: $imgUrl, ')
          ..write('phoneNum: $phoneNum, ')
          ..write('address: $address, ')
          ..write('birthPlace: $birthPlace, ')
          ..write('birthDate: $birthDate, ')
          ..write('identity: $identity, ')
          ..write('distantRelative: $distantRelative, ')
          ..write('place: $place')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              gender.hashCode,
              $mrjc(
                  bloodType.hashCode,
                  $mrjc(
                      imgUrl.hashCode,
                      $mrjc(
                          phoneNum.hashCode,
                          $mrjc(
                              address.hashCode,
                              $mrjc(
                                  birthPlace.hashCode,
                                  $mrjc(
                                      birthDate.hashCode,
                                      $mrjc(
                                          identity.hashCode,
                                          $mrjc(distantRelative.hashCode,
                                              place.hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Employee &&
          other.id == this.id &&
          other.name == this.name &&
          other.gender == this.gender &&
          other.bloodType == this.bloodType &&
          other.imgUrl == this.imgUrl &&
          other.phoneNum == this.phoneNum &&
          other.address == this.address &&
          other.birthPlace == this.birthPlace &&
          other.birthDate == this.birthDate &&
          other.identity == this.identity &&
          other.distantRelative == this.distantRelative &&
          other.place == this.place);
}

class EmployeesCompanion extends UpdateCompanion<Employee> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> gender;
  final Value<String> bloodType;
  final Value<String> imgUrl;
  final Value<String> phoneNum;
  final Value<String> address;
  final Value<String> birthPlace;
  final Value<String> birthDate;
  final Value<String> identity;
  final Value<String> distantRelative;
  final Value<String> place;
  const EmployeesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.gender = const Value.absent(),
    this.bloodType = const Value.absent(),
    this.imgUrl = const Value.absent(),
    this.phoneNum = const Value.absent(),
    this.address = const Value.absent(),
    this.birthPlace = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.identity = const Value.absent(),
    this.distantRelative = const Value.absent(),
    this.place = const Value.absent(),
  });
  EmployeesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.gender = const Value.absent(),
    this.bloodType = const Value.absent(),
    this.imgUrl = const Value.absent(),
    this.phoneNum = const Value.absent(),
    this.address = const Value.absent(),
    this.birthPlace = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.identity = const Value.absent(),
    this.distantRelative = const Value.absent(),
    this.place = const Value.absent(),
  }) : name = Value(name);
  EmployeesCompanion copyWith(
      {Value<String> id,
      Value<String> name,
      Value<String> gender,
      Value<String> bloodType,
      Value<String> imgUrl,
      Value<String> phoneNum,
      Value<String> address,
      Value<String> birthPlace,
      Value<String> birthDate,
      Value<String> identity,
      Value<String> distantRelative,
      Value<String> place}) {
    return EmployeesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      bloodType: bloodType ?? this.bloodType,
      imgUrl: imgUrl ?? this.imgUrl,
      phoneNum: phoneNum ?? this.phoneNum,
      address: address ?? this.address,
      birthPlace: birthPlace ?? this.birthPlace,
      birthDate: birthDate ?? this.birthDate,
      identity: identity ?? this.identity,
      distantRelative: distantRelative ?? this.distantRelative,
      place: place ?? this.place,
    );
  }
}

class $EmployeesTable extends Employees
    with TableInfo<$EmployeesTable, Employee> {
  final GeneratedDatabase _db;
  final String _alias;
  $EmployeesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false,
        defaultValue: Constant(Uuid().v1()));
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 3, maxTextLength: 45);
  }

  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  GeneratedTextColumn _gender;
  @override
  GeneratedTextColumn get gender => _gender ??= _constructGender();
  GeneratedTextColumn _constructGender() {
    return GeneratedTextColumn('gender', $tableName, true,
        minTextLength: 3, maxTextLength: 12);
  }

  final VerificationMeta _bloodTypeMeta = const VerificationMeta('bloodType');
  GeneratedTextColumn _bloodType;
  @override
  GeneratedTextColumn get bloodType => _bloodType ??= _constructBloodType();
  GeneratedTextColumn _constructBloodType() {
    return GeneratedTextColumn('blood_type', $tableName, true,
        minTextLength: 1, maxTextLength: 5);
  }

  final VerificationMeta _imgUrlMeta = const VerificationMeta('imgUrl');
  GeneratedTextColumn _imgUrl;
  @override
  GeneratedTextColumn get imgUrl => _imgUrl ??= _constructImgUrl();
  GeneratedTextColumn _constructImgUrl() {
    return GeneratedTextColumn('img_url', $tableName, true,
        minTextLength: 5, maxTextLength: 96);
  }

  final VerificationMeta _phoneNumMeta = const VerificationMeta('phoneNum');
  GeneratedTextColumn _phoneNum;
  @override
  GeneratedTextColumn get phoneNum => _phoneNum ??= _constructPhoneNum();
  GeneratedTextColumn _constructPhoneNum() {
    return GeneratedTextColumn('phone_num', $tableName, true,
        minTextLength: 8, maxTextLength: 18);
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn('address', $tableName, true,
        minTextLength: 5, maxTextLength: 96);
  }

  final VerificationMeta _birthPlaceMeta = const VerificationMeta('birthPlace');
  GeneratedTextColumn _birthPlace;
  @override
  GeneratedTextColumn get birthPlace => _birthPlace ??= _constructBirthPlace();
  GeneratedTextColumn _constructBirthPlace() {
    return GeneratedTextColumn('birth_place', $tableName, true,
        minTextLength: 5, maxTextLength: 30);
  }

  final VerificationMeta _birthDateMeta = const VerificationMeta('birthDate');
  GeneratedTextColumn _birthDate;
  @override
  GeneratedTextColumn get birthDate => _birthDate ??= _constructBirthDate();
  GeneratedTextColumn _constructBirthDate() {
    return GeneratedTextColumn('birth_date', $tableName, true,
        minTextLength: 5, maxTextLength: 18);
  }

  final VerificationMeta _identityMeta = const VerificationMeta('identity');
  GeneratedTextColumn _identity;
  @override
  GeneratedTextColumn get identity => _identity ??= _constructIdentity();
  GeneratedTextColumn _constructIdentity() {
    return GeneratedTextColumn('identity', $tableName, true,
        minTextLength: 3, maxTextLength: 18);
  }

  final VerificationMeta _distantRelativeMeta =
      const VerificationMeta('distantRelative');
  GeneratedTextColumn _distantRelative;
  @override
  GeneratedTextColumn get distantRelative =>
      _distantRelative ??= _constructDistantRelative();
  GeneratedTextColumn _constructDistantRelative() {
    return GeneratedTextColumn('distant_relative', $tableName, true,
        minTextLength: 3, maxTextLength: 96);
  }

  final VerificationMeta _placeMeta = const VerificationMeta('place');
  GeneratedTextColumn _place;
  @override
  GeneratedTextColumn get place => _place ??= _constructPlace();
  GeneratedTextColumn _constructPlace() {
    return GeneratedTextColumn('place', $tableName, true,
        minTextLength: 3, maxTextLength: 96);
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        gender,
        bloodType,
        imgUrl,
        phoneNum,
        address,
        birthPlace,
        birthDate,
        identity,
        distantRelative,
        place
      ];
  @override
  $EmployeesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'employees';
  @override
  final String actualTableName = 'employees';
  @override
  VerificationContext validateIntegrity(EmployeesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.gender.present) {
      context.handle(
          _genderMeta, gender.isAcceptableValue(d.gender.value, _genderMeta));
    }
    if (d.bloodType.present) {
      context.handle(_bloodTypeMeta,
          bloodType.isAcceptableValue(d.bloodType.value, _bloodTypeMeta));
    }
    if (d.imgUrl.present) {
      context.handle(
          _imgUrlMeta, imgUrl.isAcceptableValue(d.imgUrl.value, _imgUrlMeta));
    }
    if (d.phoneNum.present) {
      context.handle(_phoneNumMeta,
          phoneNum.isAcceptableValue(d.phoneNum.value, _phoneNumMeta));
    }
    if (d.address.present) {
      context.handle(_addressMeta,
          address.isAcceptableValue(d.address.value, _addressMeta));
    }
    if (d.birthPlace.present) {
      context.handle(_birthPlaceMeta,
          birthPlace.isAcceptableValue(d.birthPlace.value, _birthPlaceMeta));
    }
    if (d.birthDate.present) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableValue(d.birthDate.value, _birthDateMeta));
    }
    if (d.identity.present) {
      context.handle(_identityMeta,
          identity.isAcceptableValue(d.identity.value, _identityMeta));
    }
    if (d.distantRelative.present) {
      context.handle(
          _distantRelativeMeta,
          distantRelative.isAcceptableValue(
              d.distantRelative.value, _distantRelativeMeta));
    }
    if (d.place.present) {
      context.handle(
          _placeMeta, place.isAcceptableValue(d.place.value, _placeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Employee map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Employee.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(EmployeesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.gender.present) {
      map['gender'] = Variable<String, StringType>(d.gender.value);
    }
    if (d.bloodType.present) {
      map['blood_type'] = Variable<String, StringType>(d.bloodType.value);
    }
    if (d.imgUrl.present) {
      map['img_url'] = Variable<String, StringType>(d.imgUrl.value);
    }
    if (d.phoneNum.present) {
      map['phone_num'] = Variable<String, StringType>(d.phoneNum.value);
    }
    if (d.address.present) {
      map['address'] = Variable<String, StringType>(d.address.value);
    }
    if (d.birthPlace.present) {
      map['birth_place'] = Variable<String, StringType>(d.birthPlace.value);
    }
    if (d.birthDate.present) {
      map['birth_date'] = Variable<String, StringType>(d.birthDate.value);
    }
    if (d.identity.present) {
      map['identity'] = Variable<String, StringType>(d.identity.value);
    }
    if (d.distantRelative.present) {
      map['distant_relative'] =
          Variable<String, StringType>(d.distantRelative.value);
    }
    if (d.place.present) {
      map['place'] = Variable<String, StringType>(d.place.value);
    }
    return map;
  }

  @override
  $EmployeesTable createAlias(String alias) {
    return $EmployeesTable(_db, alias);
  }
}

class Attendance extends DataClass implements Insertable<Attendance> {
  final String id;
  final String enterAt;
  final String outAt;
  final String date;
  Attendance(
      {@required this.id, this.enterAt, this.outAt, @required this.date});
  factory Attendance.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Attendance(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      enterAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}enter_at']),
      outAt:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}out_at']),
      date: stringType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  factory Attendance.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Attendance(
      id: serializer.fromJson<String>(json['id']),
      enterAt: serializer.fromJson<String>(json['enterAt']),
      outAt: serializer.fromJson<String>(json['outAt']),
      date: serializer.fromJson<String>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'enterAt': serializer.toJson<String>(enterAt),
      'outAt': serializer.toJson<String>(outAt),
      'date': serializer.toJson<String>(date),
    };
  }

  @override
  AttendancesCompanion createCompanion(bool nullToAbsent) {
    return AttendancesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      enterAt: enterAt == null && nullToAbsent
          ? const Value.absent()
          : Value(enterAt),
      outAt:
          outAt == null && nullToAbsent ? const Value.absent() : Value(outAt),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  Attendance copyWith({String id, String enterAt, String outAt, String date}) =>
      Attendance(
        id: id ?? this.id,
        enterAt: enterAt ?? this.enterAt,
        outAt: outAt ?? this.outAt,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Attendance(')
          ..write('id: $id, ')
          ..write('enterAt: $enterAt, ')
          ..write('outAt: $outAt, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(enterAt.hashCode, $mrjc(outAt.hashCode, date.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Attendance &&
          other.id == this.id &&
          other.enterAt == this.enterAt &&
          other.outAt == this.outAt &&
          other.date == this.date);
}

class AttendancesCompanion extends UpdateCompanion<Attendance> {
  final Value<String> id;
  final Value<String> enterAt;
  final Value<String> outAt;
  final Value<String> date;
  const AttendancesCompanion({
    this.id = const Value.absent(),
    this.enterAt = const Value.absent(),
    this.outAt = const Value.absent(),
    this.date = const Value.absent(),
  });
  AttendancesCompanion.insert({
    this.id = const Value.absent(),
    this.enterAt = const Value.absent(),
    this.outAt = const Value.absent(),
    @required String date,
  }) : date = Value(date);
  AttendancesCompanion copyWith(
      {Value<String> id,
      Value<String> enterAt,
      Value<String> outAt,
      Value<String> date}) {
    return AttendancesCompanion(
      id: id ?? this.id,
      enterAt: enterAt ?? this.enterAt,
      outAt: outAt ?? this.outAt,
      date: date ?? this.date,
    );
  }
}

class $AttendancesTable extends Attendances
    with TableInfo<$AttendancesTable, Attendance> {
  final GeneratedDatabase _db;
  final String _alias;
  $AttendancesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false,
        defaultValue: Constant(Uuid().v1()));
  }

  final VerificationMeta _enterAtMeta = const VerificationMeta('enterAt');
  GeneratedTextColumn _enterAt;
  @override
  GeneratedTextColumn get enterAt => _enterAt ??= _constructEnterAt();
  GeneratedTextColumn _constructEnterAt() {
    return GeneratedTextColumn(
      'enter_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _outAtMeta = const VerificationMeta('outAt');
  GeneratedTextColumn _outAt;
  @override
  GeneratedTextColumn get outAt => _outAt ??= _constructOutAt();
  GeneratedTextColumn _constructOutAt() {
    return GeneratedTextColumn(
      'out_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedTextColumn _date;
  @override
  GeneratedTextColumn get date => _date ??= _constructDate();
  GeneratedTextColumn _constructDate() {
    return GeneratedTextColumn(
      'date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, enterAt, outAt, date];
  @override
  $AttendancesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'attendances';
  @override
  final String actualTableName = 'attendances';
  @override
  VerificationContext validateIntegrity(AttendancesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.enterAt.present) {
      context.handle(_enterAtMeta,
          enterAt.isAcceptableValue(d.enterAt.value, _enterAtMeta));
    }
    if (d.outAt.present) {
      context.handle(
          _outAtMeta, outAt.isAcceptableValue(d.outAt.value, _outAtMeta));
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Attendance map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Attendance.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(AttendancesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.enterAt.present) {
      map['enter_at'] = Variable<String, StringType>(d.enterAt.value);
    }
    if (d.outAt.present) {
      map['out_at'] = Variable<String, StringType>(d.outAt.value);
    }
    if (d.date.present) {
      map['date'] = Variable<String, StringType>(d.date.value);
    }
    return map;
  }

  @override
  $AttendancesTable createAlias(String alias) {
    return $AttendancesTable(_db, alias);
  }
}

class Site extends DataClass implements Insertable<Site> {
  final String id;
  final String siteName;
  final String aliasName;
  final String location;
  Site(
      {@required this.id,
      @required this.siteName,
      @required this.aliasName,
      @required this.location});
  factory Site.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Site(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      siteName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}site_name']),
      aliasName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}alias_name']),
      location: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
    );
  }
  factory Site.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Site(
      id: serializer.fromJson<String>(json['id']),
      siteName: serializer.fromJson<String>(json['siteName']),
      aliasName: serializer.fromJson<String>(json['aliasName']),
      location: serializer.fromJson<String>(json['location']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'siteName': serializer.toJson<String>(siteName),
      'aliasName': serializer.toJson<String>(aliasName),
      'location': serializer.toJson<String>(location),
    };
  }

  @override
  SitesCompanion createCompanion(bool nullToAbsent) {
    return SitesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      siteName: siteName == null && nullToAbsent
          ? const Value.absent()
          : Value(siteName),
      aliasName: aliasName == null && nullToAbsent
          ? const Value.absent()
          : Value(aliasName),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
    );
  }

  Site copyWith(
          {String id, String siteName, String aliasName, String location}) =>
      Site(
        id: id ?? this.id,
        siteName: siteName ?? this.siteName,
        aliasName: aliasName ?? this.aliasName,
        location: location ?? this.location,
      );
  @override
  String toString() {
    return (StringBuffer('Site(')
          ..write('id: $id, ')
          ..write('siteName: $siteName, ')
          ..write('aliasName: $aliasName, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(siteName.hashCode, $mrjc(aliasName.hashCode, location.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Site &&
          other.id == this.id &&
          other.siteName == this.siteName &&
          other.aliasName == this.aliasName &&
          other.location == this.location);
}

class SitesCompanion extends UpdateCompanion<Site> {
  final Value<String> id;
  final Value<String> siteName;
  final Value<String> aliasName;
  final Value<String> location;
  const SitesCompanion({
    this.id = const Value.absent(),
    this.siteName = const Value.absent(),
    this.aliasName = const Value.absent(),
    this.location = const Value.absent(),
  });
  SitesCompanion.insert({
    this.id = const Value.absent(),
    @required String siteName,
    @required String aliasName,
    @required String location,
  })  : siteName = Value(siteName),
        aliasName = Value(aliasName),
        location = Value(location);
  SitesCompanion copyWith(
      {Value<String> id,
      Value<String> siteName,
      Value<String> aliasName,
      Value<String> location}) {
    return SitesCompanion(
      id: id ?? this.id,
      siteName: siteName ?? this.siteName,
      aliasName: aliasName ?? this.aliasName,
      location: location ?? this.location,
    );
  }
}

class $SitesTable extends Sites with TableInfo<$SitesTable, Site> {
  final GeneratedDatabase _db;
  final String _alias;
  $SitesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false,
        defaultValue: Constant(Uuid().v1()));
  }

  final VerificationMeta _siteNameMeta = const VerificationMeta('siteName');
  GeneratedTextColumn _siteName;
  @override
  GeneratedTextColumn get siteName => _siteName ??= _constructSiteName();
  GeneratedTextColumn _constructSiteName() {
    return GeneratedTextColumn(
      'site_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _aliasNameMeta = const VerificationMeta('aliasName');
  GeneratedTextColumn _aliasName;
  @override
  GeneratedTextColumn get aliasName => _aliasName ??= _constructAliasName();
  GeneratedTextColumn _constructAliasName() {
    return GeneratedTextColumn(
      'alias_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _locationMeta = const VerificationMeta('location');
  GeneratedTextColumn _location;
  @override
  GeneratedTextColumn get location => _location ??= _constructLocation();
  GeneratedTextColumn _constructLocation() {
    return GeneratedTextColumn(
      'location',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, siteName, aliasName, location];
  @override
  $SitesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'sites';
  @override
  final String actualTableName = 'sites';
  @override
  VerificationContext validateIntegrity(SitesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.siteName.present) {
      context.handle(_siteNameMeta,
          siteName.isAcceptableValue(d.siteName.value, _siteNameMeta));
    } else if (isInserting) {
      context.missing(_siteNameMeta);
    }
    if (d.aliasName.present) {
      context.handle(_aliasNameMeta,
          aliasName.isAcceptableValue(d.aliasName.value, _aliasNameMeta));
    } else if (isInserting) {
      context.missing(_aliasNameMeta);
    }
    if (d.location.present) {
      context.handle(_locationMeta,
          location.isAcceptableValue(d.location.value, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Site map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Site.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(SitesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.siteName.present) {
      map['site_name'] = Variable<String, StringType>(d.siteName.value);
    }
    if (d.aliasName.present) {
      map['alias_name'] = Variable<String, StringType>(d.aliasName.value);
    }
    if (d.location.present) {
      map['location'] = Variable<String, StringType>(d.location.value);
    }
    return map;
  }

  @override
  $SitesTable createAlias(String alias) {
    return $SitesTable(_db, alias);
  }
}

abstract class _$AppDB extends GeneratedDatabase {
  _$AppDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  $EmployeesTable _employees;
  $EmployeesTable get employees => _employees ??= $EmployeesTable(this);
  $AttendancesTable _attendances;
  $AttendancesTable get attendances => _attendances ??= $AttendancesTable(this);
  $SitesTable _sites;
  $SitesTable get sites => _sites ??= $SitesTable(this);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as AppDB);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, employees, attendances, sites];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$UserDaoMixin on DatabaseAccessor<AppDB> {
  $UsersTable get users => db.users;
  $EmployeesTable get employees => db.employees;
  $AttendancesTable get attendances => db.attendances;
  $SitesTable get sites => db.sites;
}

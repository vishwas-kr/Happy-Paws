class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? password;
  String? mobileNumber;
  String? petName;
  String? address;
  String? image;

  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.secondName,
    this.password,
    this.mobileNumber,
    this.address,
    this.petName,
    this.image,
  });

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      password: map['password'],
      mobileNumber: map['mobileNumber'],
      petName: map['petName'],
      address: map['address'],
      image: map['image'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'mobileNumber': mobileNumber,
      'password': password,
      'petName': petName,
      'address': address,
      'image': image,
    };
  }
}

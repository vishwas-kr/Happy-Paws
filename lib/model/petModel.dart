class PetModel {
  String? uid;
  String? petName;
  String? petAge;
  String? petSize;
  String? petBreed;
  String? petGender;
  String? petNetured;
  String? petHealth;
  String? petSymptoms;
  String? petImage;

  PetModel(
      {this.uid,
      this.petName,
      this.petAge,
      this.petSize,
      this.petBreed,
      this.petGender,
      this.petNetured,
      this.petHealth,
      this.petSymptoms,
      this.petImage});

  // receiving data from server
  factory PetModel.fromMap(map) {
    return PetModel(
      uid: map['uid'],
      petAge: map['petAge'],
      petSize: map['petSize'],
      petBreed: map['petBreed'],
      petGender: map['petGender'],
      petNetured: map['petNetured'],
      petHealth: map['petHealth'],
      petName: map['petName'],
      petSymptoms: map['petSymptoms'],
      petImage: map['petImage'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'petName': petName,
      'petSize': petSize,
      'petBreed': petBreed,
      'petGender': petGender,
      'petNetured': petNetured,
      'petHealth': petHealth,
      'petSymptoms': petSymptoms,
      'petAge': petAge,
      'petImage': petImage,
    };
  }
}

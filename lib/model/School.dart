import 'dart:convert';

class School {
  String? Id;
  String? Logo;
  String? Background;
  String? Name;
  String? Description;
  String? Color;
  List<Program>? programs; // Danh sách các chương trình
  List<Operation>? operations;
  List<Requirement>? requirements;
  List<History>? history;

  School(
      {this.Id,
      this.Logo,
      this.Background,
      this.Name,
      this.Description,
      this.Color,
      this.programs,
      this.operations,
      this.requirements,
      this.history});

  static List<School> parseList(response) {
    var list = json.decode(response.body) as List;
    return list.map((item) => School.fromJson(item)).toList();
  }

  factory School.fromJson(Map<String, dynamic> json) {
    // Chuyển đổi danh sách chương trình từ danh sách JSON con
    List<Program> programList = List<Program>.from(
      json['programs'].map((programJson) => Program.fromJson(programJson)),
    );

    List<Operation> operationList = List<Operation>.from(
      json['operations']
          .map((operationJson) => Operation.fromJson(operationJson)),
    );

    List<Requirement> requirement = List<Requirement>.from(json['requirement']
        .map((operationJson) => Requirement.fromJson(operationJson)));
    List<History> history = List<History>.from(json['history']
        .map((operationJson) => History.fromJson(operationJson)));

    //Requirement requirement = Requirement.fromJson(json['requirement']);
    //History history = History.fromJson(json['history']);

    // Trả về đối tượng School với dữ liệu được trích xuất
    return School(
      Id: json['id'],
      Logo: json['logoUrl'],
      Background: json['backgroundUrl'],
      Name: json['name'],
      Color: json['colorValue'],
      programs: programList,
      operations: operationList,
      requirements: requirement,
      history: history,
    );
  }
}

class Program {
  String? id;
  String? name;
  String? description1;
  String? description2;
  int? price;
  String? img1;
  String? img2;
  bool? isPulished;
  String? schoolId;
  String? logo;

  // Constructor
  Program(
      {this.id,
      this.name,
      this.description1,
      this.description2,
      this.price,
      this.img1,
      this.img2,
      this.isPulished,
      this.schoolId,
      this.logo});

// Factory method cho lớp Program
  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
        id: json['id'],
        name: json['name'],
        description1: json['description1'],
        description2: json['description2'],
        img1: json['Image1'],
        img2: json['Image2'],
        isPulished: json['isPublished'],
        schoolId: json['schoolId'],
        logo: "");
  }
}

class Operation {
  String? id;
  String? name;
  String? description;
  String? backgroundurl;
  String? address;
  bool? isPulished;
  String? schoolId;

  Operation(
      {this.id,
      this.name,
      this.description,
      this.backgroundurl,
      this.address,
      this.isPulished,
      this.schoolId});

  factory Operation.fromJson(Map<String, dynamic> json) {
    return Operation(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        backgroundurl: json['backgroundUrl'],
        address: json['address'],
        isPulished: json['isPublished'],
        schoolId: json['schoolId']);
  }
}

class Requirement {
  String? id;
  String? description;
  String? schoolId;

  Requirement({
    this.id,
    this.description,
    this.schoolId,
  });

  factory Requirement.fromJson(Map<String, dynamic> json) {
    return Requirement(
        id: json['id'],
        description: json['description'],
        schoolId: json['schoolId']);
  }
}

class History {
  String? id;
  String? img;
  String? description1;
  String? description2;
  String? schoolId;

  History({
    this.id,
    this.img,
    this.description1,
    this.description2,
    this.schoolId,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
        id: json['id'],
        img: json['imageUrl'],
        description1: json['description1'],
        description2: json['description2'],
        schoolId: json['schoolId']);
  }
}

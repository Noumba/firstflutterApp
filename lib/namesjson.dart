/// employees : [{"firstName":"John","lastName":"Doe"},{"firstName":"Anna","lastName":"Smith"},{"firstName":"Peter","lastName":"Jones"},{"firstName":"Vinci","lastName":"Leonardo"},{"firstName":"Stephany","lastName":"Ayong"},{"firstName":"Peter","lastName":"Emmanuel"}]

class Names {
  List<Employees> _employees;

  List<Employees> get employees => _employees;

  Names({
      List<Employees> employees}){
    _employees = employees;
}

  Names.fromJson(dynamic json) {
    if (json["employees"] != null) {
      _employees = [];
      json["employees"].forEach((v) {
        _employees.add(Employees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_employees != null) {
      map["employees"] = _employees.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// firstName : "John"
/// lastName : "Doe"

class Employees {
  String _firstName;
  String _lastName;

  String get firstName => _firstName;
  String get lastName => _lastName;

  Employees({
      String firstName,
      String lastName}){
    _firstName = firstName;
    _lastName = lastName;
}

  Employees.fromJson(dynamic json) {
    _firstName = json["firstName"];
    _lastName = json["lastName"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    return map;
  }

}
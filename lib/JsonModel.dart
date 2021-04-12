
class Employees {
   String _firstName;
   String _lastName;

  String get firstName => _firstName;
  String get lastName => _lastName;
  Employees(String firstName, String lastName){
    _lastName = lastName;
    _firstName = firstName;
  }

  factory Employees.fromJson(Map<String, dynamic> json) {
    return Employees(
      json['firstName'],
      json['lastName'],
    );
  }

   Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    return map;
  }

  // Map<String, dynamic> toMap() => {
  //   'firstName' : _firstName,
  //   'lastName' : _lastName,
  // };

}
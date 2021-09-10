class Institute {
  final int? id;
  final int univ_id;
  final String inst_name;
  final String? phone;
  final String? email;
  final String inst_description;
  final List<Object>? department_id;

  Institute(
      {required this.id,
      required this.univ_id,
      required this.inst_name,
      this.phone,
      this.email,
      required this.inst_description,
      required this.department_id});

  factory Institute.fromJson(Map<String, dynamic> json) {
    return Institute(
        id: json['id'],
        univ_id: json['univ_id'],
        inst_name: json['inst_name'],
        phone: json['phone'],
        email: json['email'],
        department_id:json['department_id'],
        inst_description: json['inst_description']);
  }
}

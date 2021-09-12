class Institute {
  final String? id;
  final String? univ_id;
  final String? inst_name;
  final String? phone;
  final String? email;
  final String inst_description;
  final List<Object>? department_id;

  Institute(
      {this.id,
      this.univ_id,
      this.inst_name,
      this.phone,
      this.email,
      required this.inst_description,
      this.department_id});

  factory Institute.fromJson(Map<String, dynamic> json) {
    return Institute(
        id: json['id'],
        univ_id: json['univ_id'],
        inst_name: json['inst_name'],
        phone: json['phone'],
        email: json['email'],
        department_id: json['department_id'],
        inst_description: json['inst_description']);
  }
}

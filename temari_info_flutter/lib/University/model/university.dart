class University {
  final int? id;
  final String? univ_name;
  final String? short_name;
  final String? location;
  final String? description;
  final List<Object>? institute;
  final List<Object>? comment;
  final List<Object>? rating;

  University(
      {this.id,
      this.univ_name,
      this.short_name,
      this.location,
      this.description,
      this.institute,
      this.comment,
      this.rating});

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
        id: json['id'],
        univ_name: json['univ_name'],
        short_name: json['short_name'],
        location: json['location'],
        description: json['description'],
        institute: json['institute'],
        comment: json['comment'],
        rating: json['rating']);
  }
}

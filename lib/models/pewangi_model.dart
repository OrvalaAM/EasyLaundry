class PewangiModel {
  int? id;
  String? nama, foto, createdAt, updatedAt;

  PewangiModel({this.id, this.nama, this.foto, this.createdAt, this.updatedAt});

  factory PewangiModel.fromJson(Map<String, dynamic> json) {
    return PewangiModel(
      id: json['id'],
      nama: json['nama'],
      foto: json['foto'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

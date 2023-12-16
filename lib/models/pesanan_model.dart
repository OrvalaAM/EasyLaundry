class PesananModel {
  int? id, harga, estimasi;
  double? kuantitas;
  String? nama, noHp, alamat, jenisLayanan, namaLayanan, createdAt, updatedAt;

  PesananModel(
      {this.id,
      this.nama,
      this.noHp,
      this.alamat,
      this.jenisLayanan,
      this.namaLayanan,
      this.kuantitas,
      this.harga,
      this.estimasi,
      this.createdAt,
      this.updatedAt});

  factory PesananModel.fromJson(Map<String, dynamic> json) {
    return PesananModel(
      id: json['id'],
      nama: json['nama'],
      noHp: json['no_hp'],
      alamat: json['alamat'],
      jenisLayanan: json['jenis_layanan'],
      namaLayanan: json['nama_layanan'],
      kuantitas: json['kuantitas'],
      harga: json['harga'],
      estimasi: json['estimasi'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

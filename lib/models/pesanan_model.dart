class PesananModel {
  int? id, harga, estimasi, subtotal, kodeUnik, total;
  double? kuantitas;
  String? nama,
      noHp,
      alamat,
      jenisLayanan,
      namaLayanan,
      pewangi,
      createdAt,
      finishedAt,
      updatedAt;

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
      this.subtotal,
      this.kodeUnik,
      this.total,
      this.pewangi,
      this.createdAt,
      this.finishedAt,
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
      subtotal: json['subtotal'],
      kodeUnik: json['kode_unik'],
      total: json['total'],
      pewangi: json['pewangi'],
      createdAt: json['created_at'],
      finishedAt: json['finished_at'],
      updatedAt: json['updated_at'],
    );
  }
}

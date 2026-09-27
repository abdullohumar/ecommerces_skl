/// Format angka menjadi Rupiah lengkap, contoh: 1500000 -> Rp1.500.000
String formatRupiah(num value) {
  final formatted = value
      .toInt()
      .toString()
      .replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]}.');
  return 'Rp$formatted';
}

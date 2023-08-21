// 1. buat sebuah function yang menhitung jumlah dari pembelian buku, pensil, dan tas
// 2. buatlah function yang menghitung diskon dari variabel total pembelian
// 3. buatlah function yang menghitung total bayar setelah diskon
void main(){
  double buku = 10000;
  double pensil = 5000;
  double tas = 100000;

  double total_pembelian = 200000;
  double diskon = 0.1;

  // Jawaban Nomor 1
  double hasil = hitungJumlah(buku, pensil, tas);
  print("Jumlah pembelian dari buku, pensil dan tas: $hasil");

  // Jawaban Nomor 2
  double hasilDiskon = hitungDiskon(total_pembelian, diskon);
  print("Jumlah diskon: $hasilDiskon");

  // Jawaban Nomor 3
  double totalBayar = hitungTotalBayar(hasil, hasilDiskon);
  print("Jumlah bayar setelah didiskon: $totalBayar");
}

double hitungJumlah(double buku, double pensil, double tas){
  return buku + pensil + tas;
}

double hitungDiskon(double total_pembelian, double diskon){
  return (total_pembelian/1) * diskon;
}

double hitungTotalBayar(double hasil, double hasilDiskon){
  return hasil - hasilDiskon;
}

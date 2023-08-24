// 1. Buatlah rumus keliling dan luas persegi dan persegi panjang dengan menggunakan bahasa pemrograman Dart
// 2. Implementasikan rumus keliling dan luas dari Lingkaran dengan menggunakan Bahasa Dart

// Jawaban

// 1. Keliling dan luas persegi dan persegi panjang
// Persegi
int sisi = 5;
int luas_persegi = sisi * sisi;
int keliling_persegi = 4 * sisi;

// Persegi Panjang
int panjang = 6;
int lebar = 5;
int luas_persegi_panjang = panjang * lebar;
int keliling_persegi_panjang = 2 * (panjang + lebar);

// 2. Keliling dan luas lingkaran
int jari_jari = 7;
int diameter = 2 * jari_jari;
double luas_lingkaran = 22/7 * jari_jari * jari_jari;
double keliling_lingkaran = 22/7 * diameter;

void main() {
  print('Keliling persegi adalah: $keliling_persegi'+'cm');
  print('Luas persegi adalah: $luas_persegi'+'cm');
  print('Keliling persegi panjang adalah: $keliling_persegi_panjang'+'cm');
  print('Luas persegi panjang adalah: $luas_persegi_panjang'+'cm');
  print('Keliling lingkaran adalah: $keliling_lingkaran'+'cm');
  print('Luas lingkaran adalah: $luas_lingkaran'+'cm');
}
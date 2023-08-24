// 1. Buat 3 buah variabel yang menampung tipe data String, lalu sambungkan 3 variabel tersebut dan tampilkan pada layar.
// 2. Implementasikan rumus volume dari tabung (silinder) dengan menggunakan Bahasa Dart.

// Jawaban

// 1. Sambung 3 variabel string
String kata1 = 'Kemarin';
String kata2 = 'hari';
String kata3 = 'kamis';

// 2. Rumus volume tabung
int jari_jari = 6;
int tinggi = 14;
double volume_tabung = 22/7 * jari_jari * jari_jari * tinggi;

void main() {
  print(kata1 + ' ' + kata2 + ' ' + kata3);
  print('Volume tabung adalah: $volume_tabung'+'cm');
}


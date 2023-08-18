// Buatlah variable yang berfungsi untuk menghitung keliling persegi panjang dan luas segitiga

// 1.  Variable keliling persegi panjang
int panjang_persegi = 5;
int lebar_persegi = 5;
int keliling_persegi_panjang = 2 * (panjang_persegi + lebar_persegi);

// 2. Variable luas segitiga
int alas_segitiga = 10;
int tinggi_segitiga = 15;
double luas_segitiga = 1/2 * alas_segitiga * tinggi_segitiga;

void main(){
  print('Keliling persegi panjang adalah $keliling_persegi_panjang');
  print('Luas segitiga adalah $luas_segitiga');
}


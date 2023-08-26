/* 1. Buatlah sebuah program untuk mengecek apakah sebuah kata merupakan sebuah palindrom atau bukan. 
Palindrom adalah sebuah kata yang jika dibalik dari kata aslinya memiliki cara baca atau susunan yang 
sama persis. */

/* 2. Buatlah sebuah program untuk mencari faktor dari sebuah bilangan yang dimasukkan.*/

// Jawaban

void main() {
  String kalimat1 = 'kasur rusak';
  String kalimat2 = 'mobil balap';
  int bilangan = 30;

  List<int> faktor = faktorBilangan(bilangan);  
  
  if (cekPalindrom1(kalimat1) == kalimat1) {
    print('Kalimat 1 adalah palindrom');
  }else{
    print('Kalimat 1 bukanlah palindrom');
  }

  if (cekPalindrom2(kalimat2) == kalimat2) {
    print('Kalimat 2 adalah palindrom');
  }else{
    print('Kalimat 2 bukanlah palindrom');
  }  

  print("Faktor dari bilangan $bilangan adalah: $faktor");
}

String cekPalindrom1(String kalimat1){
  return kalimat1.split('').reversed.join();
}

String cekPalindrom2(String kalimat2){
  return kalimat2.split('').reversed.join();
}

List<int> faktorBilangan(int bilangan) {
  List<int> faktor = [];

  for (int i = 1; i <= bilangan; i++) {
    if (bilangan % i == 0) {
      faktor.add(i);
    }
  }

  return faktor;
}

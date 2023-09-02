import 'dart:io';

void main() {
  int row_piramid = 8;
  int row_jam = 6;
  int max_width = 2 * row_jam - 1;  
  double jari_jari = 7;
  
  // Tugas Looping Nomor 1

  print("Tugas Looping No. 1");
  print("");

  for (var i = 0; i < row_piramid; i++) {    
    for (var j = 0; j < row_piramid - i - 1; j++) {      
      stdout.write('  ');  
    }

    for (var k = 0; k <= 2 * i; k++) {        
      stdout.write("* ");
    }
        
    print("");
  }

  print("=======================");

  print("Tugas Looping No. 2");
  print("");

  // Tugas Looping Nomor 2
  for (int i = 0; i < row_jam; i++) {
    for (int j = 0; j < i; j++) {
      stdout.write(' ');
    }

    for (int k = 0; k < max_width - 2 * i; k++) {
      stdout.write('0');
    }

    for (int j = 0; j < i; j++) {
      stdout.write(' ');
    }

    print('');
  }

  for (int i = row_jam - 2; i >= 0; i--) {
    for (int j = 0; j < i; j++) {
      stdout.write(' ');
    }

    for (int k = 0; k < max_width - 2 * i; k++) {
      stdout.write('0');
    }

    for (int j = 0; j < i; j++) {
      stdout.write(' ');
    }

    print('');
  }

  print("=======================");

  print("Tugas Looping No. 3");
  print("");

  // Tugas Looping Nomor 3
  List<int> faktor1 = [];
  List<int> faktor2 = [];
  List<int> faktor3 = [];

  for (int i = 1; i <= 10; i++) {
    if (10 % i == 0) {
      faktor1.add(i);      
    }
  }

  for (int i = 1; i <= 40; i++) {
    if (40 % i == 0) {
      faktor2.add(i);      
    }
  }

  for (int i = 1; i <= 50; i++) {
    if (50 % i == 0) {
      faktor3.add(i);      
    }
  }

  print('Faktorial dari angka 10 adalah $faktor1');
  print('Faktorial dari angka 40 adalah $faktor2');
  print('Faktorial dari angka 50 adalah $faktor3');

  print("=======================");

  print("Tugas Function");
  print("");
  print(menghitungLuasLingkaran(jari_jari));
}

double menghitungLuasLingkaran(double jari_jari) {
  return 22/7 * jari_jari * jari_jari;
}



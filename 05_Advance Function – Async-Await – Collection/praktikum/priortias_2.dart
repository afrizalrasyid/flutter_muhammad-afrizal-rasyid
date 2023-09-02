void main() async {
  // Prioritas 2 Nomor 1
  Map<int, int> map = {};

  List<List<int>> listElement = [
    [1, 2],
    [3, 4],
    [5, 6],
    [7, 8],
  ];

  for (int i = 0; i < listElement.length; i++) {
    map[listElement[i][0]] = listElement[i][1];
  }
  print("Prioritas 2 No. 1");
  print("");

  print("List Elemen: $listElement");
  print("Map List: $map");

  
  // Prioritas 2 Nomor 2
  print("====================");
  print("Prioritas 2 No. 2");
  print("");
  

  List<int> data = [7, 5, 3, 5, 2, 1];

  hitungRataRata(data);
  double rataRata = hitungRataRata(data);


  
  print("Data: $data");
  print("Rata-rata: $rataRata");

  // Prioritas 2 Nomor 3
  print("====================");
  print("Prioritas 2 No. 3");
  print("");
  final int angka = 5; // Ganti angka dengan bilangan yang ingin dihitung faktorialnya
  final int hasilFaktorial = await Future(() => faktorial(angka));

  print('Hasil faktorial dari $angka adalah $hasilFaktorial');

}

double hitungRataRata(List<int> data){
  int total = 0;
  for (int list in data) {
    total += list;
  }

  return total / data.length.toDouble();
}

int faktorial(int n) {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    return n * faktorial(n - 1);
  }
}
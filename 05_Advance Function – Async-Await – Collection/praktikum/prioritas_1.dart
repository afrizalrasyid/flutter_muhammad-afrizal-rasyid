void main() {
  List<int> data = [2, 4, 6, 8, 10];
  int pengali = 2;

  List<int> hasilPerkalian = prioritasSatu(data, pengali);
  print(data);
  print(hasilPerkalian);
}

List<int> prioritasSatu(List<int> data, int pengali) {
  List<int> hasil = [];
  for (int item in data) {
    int hasilPerkalian = item * pengali; 
    hasil.add(hasilPerkalian);
  };
  return hasil;
}
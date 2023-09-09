void main() {
  var m1 = Mobil(kapasitas: 20); 
  var hewan = Hewan(beratBadan: 10); 
  m1.tambahMuatan(hewan); 
}

class Hewan {
  var beratBadan;

  Hewan({this.beratBadan = 0});
}

class Mobil {
  var kapasitas;
  var muatan;

  Mobil({this.kapasitas = 0, this.muatan}); 

  void tambahMuatan(Hewan hewan) {
    if (kapasitas >= hewan.beratBadan) { 
      print('Kapasitas tercukupi');
    } else {
      print('Kapasitas tidak tercukupi');
    }
  }
}

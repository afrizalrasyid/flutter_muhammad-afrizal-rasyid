void main() {
  var k1 = Calculator();  
  k1.penjumlahan();

  print("========================");

  var student1 = Student('John', 'Kelas A');
  var student2 = Student('Alice', 'Kelas B');

  var course1 = Course('Matematika', 'Pelajaran tentang matematika');
  var course2 = Course('Bahasa Inggris', 'Pelajaran tentang bahasa Inggris');

  // Menambahkan course ke student1
  student1.tambahCourse(course1);
  student1.tambahCourse(course2);

  // Menambahkan course ke student2
  student2.tambahCourse(course2);

  // Melihat daftar course student1 dan student2
  student1.lihatDaftarCourse();
  student2.lihatDaftarCourse();

  print("========================");
  // Menghapus course dari student1
  student1.hapusCourse('Matematika');
  student1.lihatDaftarCourse();
}

// Nomor 1
class Calculator{
  var bilangan1 = 20;
  var bilangan2 = 5;

  void penjumlahan(){
    print(bilangan1 + bilangan2);
  }

  void pengurangan(){
    print(bilangan1 - bilangan2);
  }

  void perkalian(){
    print(bilangan1 * bilangan2);
  }

  void pembagian(){
    print(bilangan1 / bilangan2);
  }
}

// Nomor 2
class Course {
  var judul;
  var deskripsi;

  Course(this.judul, this.deskripsi);
}

class Student {
  var nama;
  var kelas;
  var daftar_course = <Course>[]; // Gunakan List<Course> untuk menyimpan daftar course.

  Student(this.nama, this.kelas);

  // Metode untuk menambahkan course ke daftar_course.
  void tambahCourse(Course course) {
    daftar_course.add(course);
  }

  // Metode untuk menghapus course dari daftar_course berdasarkan judul.
  void hapusCourse(String judulCourse) {
    daftar_course.removeWhere((course) => course.judul == judulCourse);
  }

  // Metode untuk melihat semua course yang telah ditambahkan.
  void lihatDaftarCourse() {
    print('Daftar Course untuk $nama:');
    for (var course in daftar_course) {
      print('Judul: ${course.judul}, Deskripsi: ${course.deskripsi}');
    }
  }
}

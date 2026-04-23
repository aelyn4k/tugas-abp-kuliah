void main() {
  List<List<int>> data = [];

  // Baris 1: kelipatan 6
  List<int> baris1 = [];
  for (int i = 0; i < 4; i++) {
    baris1.add(6 * (i + 1));
  }

  // Baris 2: ganjil
  List<int> baris2 = [];
  int ganjil = 3;
  for (int i = 0; i < 5; i++) {
    baris2.add(ganjil);
    ganjil += 2;
  }

  // Baris 3: pangkat 3
  List<int> baris3 = [];
  for (int i = 4; i < 10; i++) {
    baris3.add(i * i * i);
  }

  // Baris 4: beda 7
  List<int> baris4 = [];
  int angka = 3;
  for (int i = 0; i < 7; i++) {
    baris4.add(angka);
    angka += 7;
  }

  data.add(baris1);
  data.add(baris2);
  data.add(baris3);
  data.add(baris4);

  print("Isi List:");
  for (var row in data) {
    print(row.join(" "));
  }

  int a = 12;
  int b = 8;

  print("\nBilangan 1: $a");
  print("Bilangan 2: $b");
  print("FPB $a dan $b = ${fpb(a, b)}");
}

int fpb(int a, int b) {
  while (b != 0) {
    int sisa = a % b;
    a = b;
    b = sisa;
  }
  return a;
}
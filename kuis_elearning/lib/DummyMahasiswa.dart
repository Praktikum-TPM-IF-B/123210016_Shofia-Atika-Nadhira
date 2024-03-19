import 'dart:math';

class Mahasiswa {
  final String nama;
  final String nim;
  final String username;
  final String _password; // Make password private
  final double ipk;
  final int tahunMasuk;
  final int totalSKS;
  final int semesterSaatIni;

  // Constructor with all properties
  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.username,
    required String password, // Password set in constructor
    required this.ipk,
    required this.tahunMasuk,
    required this.totalSKS,
    required this.semesterSaatIni,
  }) : _password = password; // Assign password

  // Getter for password
  String get password => _password;
}

void main() {
  List<String> namaMahasiswa = [
    "Irma Wang",
    "Angela Nolan",
    "Mara Lucero",
    "Kirby Larsen",
    "King Rich",
    "Pearlie Esparza",
    "Elva Zamora",
    "Kirk Walton",
    "Jackson Mann",
    "Bryon Schroeder",
    "Gwen Blanchard",
    "Jasmine Lucas",
    "Jermaine Medina",
    "Marc Snyder",
    "Leila Hatfield",
    "Millie Barnes",
    "Thelma Carlson",
    "Annette Norris",
    "Werner Mayo",
    "Gertrude Morgan",
    "Trisha Terry",
    "Maria Proctor",
    "Shelton Garner",
    "Kelli Bowman",
    "Evangelina Ramos",
    "Diego Hayes",
    "Jake Townsend",
    "Wilma Haas",
    "Gordon Fletcher",
    "Tony Dixon",
    "Aron Stewart",
    "Marquita Patrick",
    "Benito Burgess",
    "Rick Pruitt",
    "Bertha Bush",
    "Kenny Alvarez",
    "Melody Young",
    "Chang Melendez",
    "Nathanial Cummings",
    "Ginger Buck",
    "Lucille Klein",
    "Anibal Barry",
    "Gloria Vazquez",
    "Tyree Clark",
    "Dana Oneal",
    "Jerold Juarez",
    "Irvin Goodwin",
    "Kerry Jacobs",
    "Ladonna Li",
    "Carmella Rasmussen",
    "Reginald Wilkerson",
    "Celeste Stafford",
    "Michel Ritter",
    "Johnathan Morgan",
    "Donnell Terry",
    "Boyd Kerr",
    "Doris Delacruz",
    "Janelle Jones",
    "Rubin Gallegos",
    "Rebecca House",
    "Booker Campbell",
    "Norman Mcconnell",
    "Damon Dawson",
    "May Mckinney",
    "Chester Walsh",
    "Reyes Mullins",
    "Yesenia Mccall",
    "Rob Larsen",
    "Ann Clark",
    "Floyd Fleming",
    "Ahmed Greer",
    "Lea Clarke",
    "Ashlee Brooks",
    "Renee Benson",
    "Lynn Roth",
    "Sal Perkins",
    "Sarah Flowers",
    "Theo Welch",
    "Mollie Holt",
    "Esther Kirby",
    "Chance Hammond",
    "Reyna Chang",
    "Janette Mccoy",
    "Danny Mccullough",
    "Arnoldo Nguyen",
    "Lisa Jensen",
    "Harrison Haas",
    "Josie Bush",
    "Darin Golden",
    "Sue Pennington",
    "Carrie Ward",
    "Marquita Pollard",
    "Clay Henry",
    "Cyrus Buck",
    "Rey Underwood",
    "Duane Skinner",
    "Marissa Doyle",
    "Andy Mccormick",
    "Mariano Duke",
    "Brenton Spears"
  ];

  List<Mahasiswa> mahasiswas = [];

  // Generate Mahasiswa data
  for (int i = 0; i < namaMahasiswa.length; i++) {
    String nama = namaMahasiswa[i];
    String nim = "123210${(i + 1).toString().padLeft(3, '0')}";
    String username = generateUsername(nama, nim);
    String password = generatePassword(nama, nim);
    double ipk = generateRandomIPK();
    int tahunMasuk = generateRandomTahunMasuk();
    int totalSKS = generateRandomTotalSKS();
    int semesterSaatIni = generateRandomSemester();

    mahasiswas.add(Mahasiswa(
      nama: nama,
      nim: nim,
      username: username,
      password: password,
      ipk: ipk,
      tahunMasuk: tahunMasuk,
      totalSKS: totalSKS,
      semesterSaatIni: semesterSaatIni,
    ));
  }

  // Print the list of Mahasiswa
  mahasiswas.forEach((mahasiswa) {
    print("Nama: ${mahasiswa.nama}");
    print("NIM: ${mahasiswa.nim}");
    print("Username: ${mahasiswa.username}");
    print("Password: ${mahasiswa.password}");
    print("IPK: ${mahasiswa.ipk}");
    print("Tahun Masuk: ${mahasiswa.tahunMasuk}");
    print("Total SKS: ${mahasiswa.totalSKS}");
    print("Semester Saat Ini: ${mahasiswa.semesterSaatIni}");
    print("-------------------------");
  });
}

// Implement your username generation function
String generateUsername(String nama, String nim) {
  String namaPertama = nama.split(" ").first.toLowerCase();
  String tigaDigitTerakhirNIM = nim.substring(nim.length - 3);
  return "$namaPertama$tigaDigitTerakhirNIM";
}

// Implement your password generation function
String generatePassword(String nama, String nim) {
  String namaTerakhir = nama.split(" ").last.toLowerCase();
  return "$nim$namaTerakhir";
}

// Implement your random IPK generation function (just for example)
double generateRandomIPK() {
  return double.parse(
      ((Random().nextDouble() * (4.0 - 2.0) + 2.0).toStringAsFixed(2)));
}

// Implement your random Tahun Masuk generation function (just for example)
int generateRandomTahunMasuk() {
  return Random().nextInt(5) + 2020;
}

// Implement your random Total SKS generation function (just for example)
int generateRandomTotalSKS() {
  return Random().nextInt(120) + 1;
}

// Implement your random Semester Saat Ini generation function (just for example)
int generateRandomSemester() {
  return Random().nextInt(8) + 1;
}

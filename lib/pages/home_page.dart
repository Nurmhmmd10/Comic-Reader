import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'bookmark_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> popularComics = [
  {
    "title": "Terminally-Ill Genius Dark Knight",
    "chapter": "Ch. 118",
    "image": "assets/images/terminally.jpg", 
    "rating": 8.5,
    "genre": "Action, Adventure, Fantasy",
    "synopsis": "Manhwa Terminally-Ill Genius Dark Knight yang dibuat oleh komikus bernama Jung Seon-yul ini bercerita tentang game RPG fantasi yang terkenal karena tingkat kesulitannya yang ekstrim. Namun, bagi Yoo Chan, yang didiagnosis menderita penyakit mematikan di usia muda, game ini adalah seluruh hidupnya dan kini telah menjadi kenyataan. Mulai sekarang, Yoo Chan harus bertahan hidup di dunia ini sebagai Nox von Reinharber, penjahat terburuk di babak akhir pertama permainan. Akankah dia bisa mencapai akhir cerita dengan aman?",
    "totalChapters": 118,
  },
  {
    "title": "Solo Max-Level Newbie",
    "chapter": "Ch. 226",
    "image": "assets/images/newbie.jpg",
    "rating": 8.6,
    "genre": "Action, Adventure, Fantasy",
    "synopsis": "Jinhyuk, seorang Nutuber game, adalah satu-satunya orang yang melihat akhir permainan [Tower of Trials]. Namun, ketika popularitas game menurun, menjadi sulit baginya untuk terus mencari nafkah sebagai Nutuber game. Karena dia sudah melihat akhir permainan, dia akan berhenti bermain. Tapi hari itu, [Tower of Trials] menjadi kenyataan, dan Jinhyuk yang tahu tentang setiap hal dalam permainan, mengambil alih segala sesuatu lebih cepat dari yang mungkin bisa dilakukan oleh siapapun! 'Akan kutunjukkan seperti apa profesional sejatinya'.",
    "totalChapters": 226,
  },
  {
    "title": "Archmage Transcending Through Regression",
    "chapter": "Ch. 168",
    "image": "assets/images/archmage.jpg",
    "rating": 8.7,
    "genre": "Action, Adventure, Fantasy, Regression",
    "synopsis": "Mikhail Walpurgis, satu-satunya Archmage Circle-9 di dunia, jatuh dalam pertempuran karena seorang pahlawan terkutuk, dan berhasil mengeluarkan satu mantra sihir tingkat tinggi untuk yang terakhir, seiring waktu, dia mundul ke 20 tahun yang lalu. 'Benar. Aku hanya harus menjadi pahlawannya.",
    "totalChapters": 168,
  },
  {
    "title": "Lu Bu's life Simulator",
    "chapter": "Ch. 135",
    "image": "assets/images/lubu.jpg",
    "rating": 9.6,
    "genre": "Action, Drama, Fantasy, Historical, Martial Arts, Sci-fi, Seinen",
    "synopsis": "'Ambil wanita tercantik, kendarai kuda perang tercepat, gunakan senjata terkuat, satu pengendara memblokir jalan GuanDong. Satu orang berdiri melawan sepuluh ribu pasukan, mereka tunduk pada pahlawan massa peperangan ini. Orang mangatakan jika Lu Bu tidak mati, tidak akan ada kesempatan untuk mewujudkan perdamaian. Saya menertawakan semua orang munafik didunia, tidak ada pahlawan lain selain Feng Xian. Memasuki kisah hidup lebih dari seribu reinkarnasi, mengalami banyak perubahan hidup, ditempa menjadi baja. Bisakah Lu Bu Feng Xian saat ini menahan akhir yang tak terakkan di Bai Men Lou?'",
    "totalChapters": 135,
  },
  {
    "title": "To Hell With Being A Saint, I'm A Doctor",
    "chapter": "Ch. 143",
    "image": "assets/images/saint.jpg",
    "rating": 9.0,
    "genre": "Action, Adventure, Fantasy, Isekai, Reincarnation, Shounen",
    "synopsis": "Yusung adalah seorang dokter jenius yang terkenal di dunia medis. Dia, yang menghabiskan seluruh hidupnya di ruang operasi, meninggal dalam kecelakaan lalu lintas, dan ketika dia bangun, dia berada di dunia lain. Tapi... orang suci? Sebuah kerajaan suci? Sihir penyembuhan? 'Saya berusaha keras untuk belajar kedokteran, tetapi sekarang yang perlu saya lakukan hanyalah menyentuh seseorang dan mereka sembuh? Serius, saya pikir saya sudah gila.'",
    "totalChapters": 143,
  },
];


  final List<Map<String, dynamic>> latestUpdates = [
    {
      "title": "Heavenly Inquisition Sword",
      "chapter": "Ch. 137",
      "image": "assets/images/inquisition.jpg",
      "rating": 7.0,
      "genre": "Action, Adventure, Fantasy, Martial Arts",
      "synopsis": "Dia adalah penguasa Sembilan Surga. Yeon Juk-Ha, anak dari seorang selir yang hidup sambil disiksa oleh ibu dan saudara-saudaranya yang lain. Setelah ayahnya meninggal karena sakit, Yeon Juk-Ha terkunci di dalam gudang... Setelah sepuluh tahun di dalam gudang, ia menerima Seni Bela Diri yang tidak manusiawi dan berhasil melarikan diri! 'Aku punya cukup masalah dengan Keluarga Yeon.' Perjalanan tanpa henti dari penerus tunggal Nine Heavens Swordsmaster melintasi Dunia Bela Diri dimulai sekarang!",
      "totalChapters": 137,
    },
    {
      "title": "Chronicles of the Demon Faction",
      "chapter": "Ch. 139",
      "image": "assets/images/chronicles.jpg",
      "rating": 7.0,
      "genre": "Action, Adventure, Demons",
      "synopsis": "Chun Hajin, pembunuh terkuat Aliansi Heavenly Righteous dari Murim Ortodoks. Hajin terbunuh ketika berusaha melarikan diri demi meraih kebebasan. Kemudian... 'Kultus Divine kekal selamanya, semua Demonic tunduk! Selamat atas kepulihan anda, tuan muda ketiga!' Dia bereinkarnasi sebagai musuh dunia murim, tuan muda ketiga Kultus Demonic?! Penaklukan kultus demonic oleh Chun Hajin, senjata rahasia murim ortodoks dimulai sekarang!",
      "totalChapters": 139,
    },
    {
      "title": "Becoming the Swordmaster Rank Young Lord of the Sichuan Tang Family",
      "chapter": "Ch. 92",
      "image": "assets/images/tang.jpg",
      "rating": 7.0,
      "genre": "Action, Drama, Fantasy, Martial Arts, Seinen",
      "synopsis": "Dulunya merupakan garis keturunan yang bergengsi dalam hal racun dan senjata tersembunyi, keluarga Tang Sichuan kini telah mengalami kemunduran. Lahir di sana, Tang Yeon-Myeong tiba-tiba terobsesi dengan pedang, membangkitkan kenangan masa lalunya di mana dia mencapai puncak ilmu pedang. 'Dalam hidup ini, saya ingin hidup dengan tenang.' Untuk hidup dengan tenang, saya harus menyembunyikan kemampuan ilmu pendang saya. Namun, ada terlalu banyak rintangan yang menghalangi saya.",
      "totalChapters": 92,
    },
    {
      "title": "Nano Machine",
      "chapter": "Ch. 280",
      "image": "assets/images/nano.jpg",
      "rating": 8.0,
      "genre": "Action, Adventure, Fantasy, Martial Arts, Wuxia",
      "synopsis": "Setelah direndahkan dan menghabiskan hidupnya dalam bahaya, seorang yatim piatu dari pemuja iblis, Yeo-Woon, mendapatkan kunjungan tak terduga dari keturunannya dari masa depan yang memasukkan sebuah mesin nano ke dalam tubuh Cheon Yeo-Woon, yang mengubah hidup Cheon Yeon-Woon setalh aktivasi. Ikuti cerita tentang perjalanan Cheon Yeo-Won, melewati pemujaan setan dan naik menjadi yang ahli beladiri terbaik baru saja dimulai.",
      "totalChapters": 280,
    },
    {
      "title": "Grim Reaper of the Drifting Moon",
      "chapter": "Ch. 107",
      "image": "assets/images/reaper.jpg",
      "rating": 7.0,
      "genre": "Action, Drama, Fantasy, Martial Arts, Mystery, Shounen",
      "synopsis": "Dia terjebak di 'Sisi Gelap' Dunia Murim nan kelam dan kejam, sebagai seorang 'Assasin'. Bukalah matamu yang lebar dan teruslah waspada, jika kau tak ingin disereet kedalam kegelapan abadi.",
      "totalChapters": 107,
    },
    {
      "title": "Return of the Disaster-Class Hero",
      "chapter": "Ch. 146",
      "image": "assets/images/disaster.jpg",
      "rating": 8.0,
      "genre": "Action, Adventure, Fantasy, Magic, Shounen",
      "synopsis": "Pernah ada pahlawan terkuat di Bumi, 'Tapi dia meninggal. Bagaimana orang yang kita bunuh akan kembali?'. 'Saya tau. Tetapi jika ada cara untuk kembali, dia akan kembali.' Tapi apakah dia benar-benar kembali setelah 20 tahun? 'Aapa yang membuatmu begitu terkejut? Mengapa. Apakah anda melakukan sesuatu yang membuat anda merasa bersalah?' Anda banjingan. Aku tidak akan membiarkanmu lolos begitu saja.",
      "totalChapters": 146,
    },
    {
      "title": "Leveling With the Gods",
      "chapter": "Ch. 146",
      "image": "assets/images/leveling.jpg",
      "rating": 7.0,
      "genre": "Action, Adventure, Fantasy",
      "synopsis": "Dia menjadi lebih kuat, lebih cepat dari orang lain... akan tetapi dia kalah. Pada akhirnya, hanya ada keputusasaan bagi Kim Yu-Won. Di saat-saat terakhirnya, dia diberi kesempaatan lagi... Melalui pengorbanan rekannya, nasibnya masih belum ditentukan. Dengan kembali ke masa lalu, dia mencoba memanjat Menara lagi dengan bakatnya yang tak tertandingi untuk melawan kejahatan kuno yang merupakan ancaman akan hancurnya Menara.",
      "totalChapters": 146,
    },
    {
      "title": "Absolute Dominion",
      "chapter": "Ch. 60",
      "image": "assets/images/absolute.jpg",
      "rating": 7.5,
      "genre": "Action, Adventure, Drama, Martial Arts, Seinen",
      "synopsis": "'Aku akan melahap jianghu ini!'. Ucapan seorang anak misterius dari pedagang buah, dengan Monarch Sword di tangan kirinya, dan Hell Blade di tangan kanannya. Tidak hanya ahli bersilat lidah tapi juga memiliki kemampuan martial yang sangat hebat, apa yang menjadi tujuan utamanya? Perjalanan yang menyenangkan dari pemuda berusia 20 tahun, 'Jeok Leegeon', yang bermimpi untuk mendominasi dunia martial, dimulai!",
      "totalChapters": 60,
    },
    {
      "title": "Academy's Undercover Professor",
      "chapter": "Ch. 138",
      "image": "assets/images/undercover.jpg",
      "rating": 7.8,
      "genre": "Action, Adventure, Comedy, Drama, Fantasy, Mystery, School Life, Shounen",
      "synopsis": "Aku tidak dilahirkan kembali dengan bakat ataupun kemampuan, tetapi setidaknya pengetahuanku dari bumi memungkinkanku untuk tetap selangkah lebih maju di dunia lain ini. Sihir ada disini, dan kemajuan baru dengan cepat dibuat dalam sains, sementara perkembangan sihir tersendat karena tradisi. Menggunakan pengetahuan dari kehidupanku sebelumnya dan tidak terikat oleh pemikiran ortodok, aku dapat melakukan hal-hal yang bahkan tidak dapat dibayangkan oelh penyihir lain. Namun, secara tidak sengaja menjadi profesor yang menyamar untukk perkumpulan rahasia misterius di akademi Soren yang terkenal tidak pernah ada dalam daftar tugasku!.",
      "totalChapters": 138,
    },
    {
      "title": "Revenge Of The Iron-Booded Sword Hound",
      "chapter": "Ch. 132",
      "image": "assets/images/hound.jpg",
      "rating": 7.9,
      "genre": "Action, Adventure, Drama, Fantasy, Harem, Project, Seinen",
      "synopsis": "Anjing pemburu dari keuarga Baskerville. Dia dicap sebagai seorang penghianat dan dieksekusi, lalu dia ditinggalkan di saat terakhirnya. Sekarang, dia sudah kembali ke 40 tahun yang lalu! 'Sekarang, mereka akan menjadi mangsaku... dan aku akan mengigit mereka sema sampai mati'",
      "totalChapters": 132,
    },
  ];

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeContent(popularComics: popularComics, latestUpdates: latestUpdates),
      const BookmarkPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Comic Reader", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue[200],
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Bookmark"),
        ],
      ),    
    );
  }
}

class HomeContent extends StatelessWidget {
  final List<Map<String, dynamic>> popularComics;
  final List<Map<String, dynamic>> latestUpdates;

  const HomeContent({super.key, required this.popularComics, required this.latestUpdates});
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(12),
          child: Text("🔥 Populer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
          
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popularComics.length,
            itemBuilder: (context, index) {
              final comic = popularComics[index];
              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(comic: comic))),
                child: Container(
                  width: 160,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          comic["image"], 
                          height: 160, 
                          width: 160, 
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              comic["title"],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              comic["chapter"],
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, size: 15, color: Colors.amber),
                                Text(" ${comic["rating"]}", style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        const Padding(
          padding: EdgeInsets.all(12),
          child: Text("🆕 Update Terbaru", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: latestUpdates.length,
          itemBuilder: (context, idx) {
            final comic = latestUpdates[idx];

            final title = (comic['title'] ?? 'Tanpa Judul').toString();
            final chapter = (comic['chapter'] ?? 'Ch. ?').toString();
            final rating = (comic['rating'] ?? '-').toString();
            final imagePath = (comic['image'] != null && comic['image'].toString().isNotEmpty)
                ? comic['image'].toString()
                : 'assets/images/placeholder.jpg';

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath, 
                    width: 60, 
                    height: 60, 
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 40, color: Colors.grey),
                  ),
                ),
                title: Text(title, overflow: TextOverflow.ellipsis),
                subtitle: Row(
                  children: [
                    Text(chapter),
                    const SizedBox(width: 8),
                    const Icon(Icons.star, color: Colors.amber, size: 15),
                    Text(" $rating", style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(comic: comic))),
              ),
            );
          },
        ),
      ],
    );
  }
}
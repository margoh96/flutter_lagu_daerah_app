class ProvinceSong {
  int id;
  String nama;
  String ibukota;
  String laguDaerah;
  String lyrics;
  String imageUrl;

  ProvinceSong(
      {required this.id,
      required this.nama,
      required this.ibukota,
      required this.laguDaerah,
      required this.lyrics,
      required this.imageUrl});
}

class ProvinceList {
  List<ProvinceSong> provinceList = [
    ProvinceSong(
      id: 1,
      nama: "Jawa Timur",
      ibukota: "Surabaya",
      laguDaerah: "Rek Ayo Rek",
      lyrics: """
Rek ayo rek
Mlaku-mlaku nang Tunjungan
Rek ayo rek
Rame-rame bebarengan
Cak ayo cak
Sopo gelem melu aku
Cak ayo cak
Rame-rame bebarengan
Iki dina minggu
Aku lungo ning Tunjungan
Ndelok kenalan anyar
Sing arep tak gandeng
Rek ayo rek
Rame-rame bebarengan
""",
      imageUrl:
          "https://kompaspedia.kompas.id/wp-content/uploads/2020/11/20190520BAH32-scaled.jpg",
    ),
    ProvinceSong(
      id: 2,
      nama: "Jawa Barat",
      ibukota: "Bandung",
      laguDaerah: "Manuk Dadali",
      lyrics: """
Manuk dadali manuk panggagah
Pahlawan abdi bangsa
Tunduh ka marcapada
Mawa mangsa
Jajauheun tina mamala

Manuk dadali pangkalan emas
Mawa kayasa simbuhi
Simba manggung
Ajenna agung
Sang manuk mulya
Kaasa puji
""",
      imageUrl:
          "https://asset.kompas.com/crops/_QBFvchNV7JtOIaVkEg0JFZfLJU=/0x0:1000x667/750x500/data/photo/2022/07/25/62dec6809a479.jpg",
    ),
    ProvinceSong(
      id: 3,
      nama: "Sumatera Utara",
      ibukota: "Medan",
      laguDaerah: "Butet",
      lyrics: """
Anak do hamuna butet
Sapangoluhon do ito
Ise do jolo mar-martalenta
Paboa ma tu amanta
Butet...Butet...
Holan ho do ito butet
Sapangoluhon do ito
Paboa ma tu amanta
""",
      imageUrl:
          "https://lpmdinamika.co/wp-content/uploads/2019/05/horas-medan-icon.jpg",
    ),
    ProvinceSong(
      id: 4,
      nama: "Bali",
      ibukota: "Denpasar",
      laguDaerah: "Janger",
      lyrics: """
Janger janger
Gek gek eong janger
Baris luh baris lelakian
Baris luh baris lelakian

Nin luh pelendo
Nin luh pelendo
Bukaangai
Eni janger

Siungan siungan
Eda mengkurebe
Janger janger
""",
      imageUrl:
          "https://asset-2.tstatic.net/bali/foto/bank/images/patung-catur-muka-ikon-kota-denpasar.jpg",
    ),
    ProvinceSong(
      id: 5,
      nama: "Yogyakarta",
      ibukota: "Yogyakarta",
      laguDaerah: "Suwe Ora Jamu",
      lyrics: """
Suwe ora jamu
Jamu godhong telo
Suwe ora ketemu
Ketemu pisan gawe gelo

Suwe ora jamu
Jamu godhong kencur
Suwe ora ketemu
Ketemu pisan gawe jempur
""",
      imageUrl:
          "https://media.suara.com/pictures/653x366/2019/10/07/31636-tugu-yogyakarta.jpg",
    ),
    ProvinceSong(
      id: 6,
      nama: "Aceh",
      ibukota: "Banda Aceh",
      laguDaerah: "Bungong Jeumpa",
      lyrics: """
Bungong jeumpa, bungong jeumpa
Meulu di ateuh, ateuh blang
Gisa lakoe, gisa lakoe
Meunyoe seulanga
Puteh, kuneng, mejampu mirah

Bagah agam, bagah agam
Mangat that rupa, that rupa
Peu jeuet that, peu jeuet that
Lheuh tuan gata
""",
      imageUrl:
          "https://assets-a1.kompasiana.com/items/album/2019/03/28/download-1-5c9c4861cc52833f950bfda2.jpeg",
    ),
    ProvinceSong(
      id: 7,
      nama: "Sumatera Barat",
      ibukota: "Padang",
      laguDaerah: "Kampuang Nan Jauh di Mato",
      lyrics: """
Kampuang nan jauh di mato
Gunuang sansai bak baju
Den takana jo kawan
Sakik hati takana

Suluah padang tarang
Nan du ombak bana
Kampuang nan jauh di mato
Kok takana pai tamu
""",
      imageUrl:
          "https://rentalmobilpadang.co.id/wp-content/uploads/2019/11/Wisata-Budaya-di-Kota-Padang-e1573140178419.jpg",
    ),
    ProvinceSong(
      id: 8,
      nama: "Sulawesi Selatan",
      ibukota: "Makassar",
      laguDaerah: "Anging Mammiri",
      lyrics: """
Anging mammiri ku pasang
Tulu' ku ga' ri takana
Tulu'ku ga' ri takana
Ewako da' mappoji

I ya taro I ya taro
Tarogena sappo na barana
Sappo na barana
Tambusu na ga' daung

Tumbu'ka tumbu'ka
Tumbu'ka tumbu'ka
Anging mammiri
Tambusu na ga' daung
""",
      imageUrl:
          "https://awsimages.detik.net.id/community/media/visual/2022/04/16/replika-bola-dunia-di-kawasan-cpi-makassar-3_169.jpeg?w=650",
    ),
    ProvinceSong(
      id: 9,
      nama: "Maluku",
      ibukota: "Ambon",
      laguDaerah: "Rasa Sayange",
      lyrics: """
Rasa sayange... rasa sayang sayange...
Eee lihat dari jauh rasa sayang sayange

Rasa sayange... rasa sayang sayange...
Eee lihat dari jauh rasa sayang sayange

Mana kancil akan dikejar
Ke kebun ada yang punya
Rasa sayang hai rasa sayang sayange
Eee lihat dari jauh rasa sayang sayange
""",
      imageUrl:
          "https://cdn.idntimes.com/content-images/post/20190906/2-0bca5444d5ff6ea46442792c65f22dd4.jpg",
    ),
    ProvinceSong(
      id: 10,
      nama: "Papua",
      ibukota: "Jayapura",
      laguDaerah: "Yamko Rambe Yamko",
      lyrics: """
Yamko rambe yamko aronawa kombe
Yamko rambe yamko aronawa kombe
Teemi nokibe kubano ko bombe ko
Yuma no bungo awe ade

Yuma no bungo awe ade
Hongke hongke hongke riro
Hongke jombe jombe riro
Hongke hongke hongke riro
Hongke jombe jombe riro
""",
      imageUrl:
          "https://cdn.antarafoto.com/cache/1200x800/2023/05/12/gapura-khas-papua-jadi-ikon-kota-jayapura-16imx-dom.jpg",
    ),
  ];
}

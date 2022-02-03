/*
class LocationCategories {
  List<String> country;
  List<String> city;
  List<String> town;

  LocationCategories({
    required this.country,
    required this.city,
    required this.town,
  });
}

*/

/*
class LocationCategories {
  final List<List<List<String>>> locations;
  final List<LocationCategories> subLocations;

  LocationCategories(this.locations, [this.subLocations = const <LocationCategories>[]]);
}

final List<LocationCategories> categories = <LocationCategories>[
  LocationCategories(
    [
      [
        ['Turkey']
      ]
    ],
    <LocationCategories>[
      LocationCategories(
        [
          [
            ['Pendik', 'Kartal'],
          ],
        ],
      )
    ],
  ),
  LocationCategories([
    [
      ['USA']
    ]
  ]),
*/
/*  LocationCategories(
    ['Turkey'],
    <LocationCategories>[
      LocationCategories(
        ['Adana','Adıyaman','Afyon','Ağrı','Amasya',
          'Ankara',
          'Antalya',
          'Artvin',
          'Aydın',
          'Balıkesir',
          'Bilecik',
          'Bingöl',
          'Bitlis',
          'Bolu',
          'Burdur',
          'Bursa',
          'Çanakkale',
        'Çankırı',
        'Çorum',
          'Denizli',
          'Diyarbakır',
          'Edirne',
          'Elâzığ',
          'Erzincan',
          'Erzurum',
          'Eskişehir',
          'Gaziantep',
          'Giresun',
          'Gümüşhane',
          'Hakkâri',
          'Hatay',
          'Isparta',
          'Mersin',
          'İstanbul',
        'İzmir',
          'Kars',
          'Kastamonu',
          'Kayseri',
          'Kırklareli',
          'Kırşehir',
          'Kocaeli',
          'Konya',
          'Kütahya',
          'Malatya',
          'Manisa',
          'Kahramanmaraş,'
          'Mardin',
          'Muğla',
          'Muş',
          'Nevşehir',
          'Niğde',
          'Ordu',
          'Rize',
          'Sakarya',
          'Samsun',
          'Siirt',
          'Sinop',
          'Sivas',
          'Tekirdağ',
          'Tokat',
          'Trabzon',
          'Tunceli',
          'Şanlıurfa',
          'Uşak',
          'Van',
          'Yozgat',
          'Zonguldak',
          'Aksaray',
          'Bayburt',
          'Karaman',
          'Kırıkkale',
          'Batman',
          'Şırnak',
          'Bartın',
          'Ardahan',
          'Iğdır',
          'Yalova',
          'Karabük',
          'Kilis',
          'Osmaniye','Düzce',],
        <LocationCategories>[

        ],
      ),
    ],
  ),*/ /*

];
*/

// The entire multilevel list displayed by this app.
/*
final List<Locations> data = <Locations>[
  Locations(
    ['Turkey'],
    <Locations>[
      Locations(
        ['İstanbul'],
        <Locations>[
          Locations(['Pendik', 'Kartal']),
        ],
      ),
      Locations(
        ['Ankara'],
        <Locations>[
          Locations(['Ulus', 'Kızılay', 'Esat'])
        ],
      ),
      Locations(['İzmir'],<Locations>[]),
    ],
  ),
  Locations(
    ['USA'],
    <Locations>[
      Locations('Section B0'),
      Locations('Section B1'),
    ],
  ),
  Locations(
    'Chapter C',
    <Locations>[
      Locations('Section C0'),
      Locations('Section C1'),
      Locations(
        'Section C2',
        <Locations>[
          Locations('Item C2.0'),
          Locations('Item C2.1'),
          Locations('Item C2.2'),
          Locations('Item C2.3'),
        ],
      ),
    ],
  ),
];
*/

/*
List<List<String>> country = [];
List<String> city = ['Adana','Bursa','Çanakkale','Denizli','Edirne','İstanbul',];
List<String> district = ['','','','','',];*/

/*class Districts{
  List<String> district;

  Districts({required this.district});
}

class Cities{
  List<List> cities;

  Cities({required this.cities});
}

class Country{
  List<List> country;

  Country({required this.country});
}


Cities city  = Cities(cities: [['']]);

*/
class Locations {
  Locations({this.location, this.sublocation, this.children = const <Locations>[]});

  final List<String>? location;
  final List<String>? sublocation;
  final List<Locations>? children;
}

final List<Locations> data = <Locations>[
  Locations(
    location: ['Turkey'],
    sublocation: ['asof','sdjglskf'],
    children: <Locations>[
      Locations(
        location: ['İstanbul'],
        sublocation: [
          'Pendik',
          'Kartal',
          'Kadıköy',
          'Tuzla',
          'Eminönü',
          'Fatih',
          'Beşiktaş',
          'Maltepe',
          'Bağcılar',
          'asfdsa',
          'gadssd',
          'sdgsdg',
          'sdgsfhğapsfr',
          'SDAŞLKFAĞSÜPKGFAS',
          'Kızılay',
          'Ulus',
          'Esat',
          'Manhanttan',
          'Bronx',
          'Queens',
          'Los Angeles',
          'San Diego',
          'San Jose',
        ],
      ),
      Locations(
        location: ['Ankara'],
        sublocation: [
          'Kızılay',
          'Ulus',
          'Esat',
        ],
      ),
    ],
  ),
  Locations(
    location: ['USA'],
    children: <Locations>[
      Locations(
        location: ['New York'],
        sublocation: [
          'Manhanttan',
          'Bronx',
          'Queens',
        ],
      ),
      Locations(
        location: ['California'],
        sublocation: [
          'Los Angeles',
          'San Diego',
          'San Jose',
        ],
      ),
    ],
  ),
];
/*
class ExpansionTileSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ExpansionTile'),
        ),
        drawer: Container(
          color: Colors.white,
          width: 200.0,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                EntryItem(data[index]),
            itemCount: data.length,
          ),
        ),
        body: Text("Hello World"),
      ),
    );
  }
}


// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Locations entry;

  Widget _buildTiles(Locations root) {
    if (root.children!.isEmpty) return ListTile(title: Text(root.location!.first));
    return ExpansionTile(
      key: PageStorageKey<Locations>(root),
      title: Text(root.location!.last),
      children: root.children!.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

void main() {
  runApp(ExpansionTileSample());
}*/
// List<List<List<String>>> location = [[['Turkey'],[]],[['USA']],['','','','',],['','','','',],];

/*List<List> turkey = [istanbul, ankara];
List<String> istanbul = ['Pendik', 'Kartal', 'Kadıköy'];
List<String> ankara = ['Kızılay', 'Ulus', 'Esat'];

List<List> usa = [newyork, california];
List<String> newyork = ['Manhanttan', 'Bronx', 'Queens'];
List<String> california = ['Los Angeles', 'San Diego', 'San Jose'];*/
/*

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Chapter A',
    <Entry>[
      Entry(
        'Section A0',
        <Entry>[
          Entry('Item A0.1'),
          Entry('Item A0.2'),
          Entry('Item A0.3'),
        ],
      ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    'Chapter B',
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
  Entry(
    'Chapter C',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
      Entry(
        'Section C2',
        <Entry>[
          Entry('Item C2.0'),
          Entry('Item C2.1'),
          Entry('Item C2.2'),
          Entry('Item C2.3'),
        ],
      ),
    ],
  ),
];
*/
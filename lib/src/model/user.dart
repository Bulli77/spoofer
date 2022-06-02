class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Julle',
  imageUrl: 'assets/women_5.jpg',
  isOnline: true,
);

// USERS
final User nikita = User(
  id: 1,
  name: 'nikita,20',
  imageUrl: 'assets/women.jpg',
  isOnline: true,
);
final User rubby = User(
  id: 2,
  name: 'Rubby,05',
  imageUrl: 'assets/women_1.jpg',
  isOnline: true,
);
final User jessy = User(
  id: 3,
  name: 'Jessy,00',
  imageUrl: 'assets/women_2.jpg',
  isOnline: false,
);
final User chawla = User(
  id: 3,
  name: 'Chawla,20',
  imageUrl: 'assets/women_3.jpg',
  isOnline: false,
);
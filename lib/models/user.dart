class User {
  final int id;
  final String username;
  User({required this.id, required this.username});
  factory User.fromJson(Map<String,dynamic> j) => User(id: int.parse(j['id'].toString()), username: j['username'].toString());
}
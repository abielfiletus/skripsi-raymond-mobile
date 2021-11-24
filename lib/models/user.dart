class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String noTelp;
  final String avatar;

  UserModel({
    required this.email,
    required this.avatar,
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.noTelp,
    required this.username,
  });

  static UserModel user = UserModel(
    email: 's32170019@student.ubm.ac.id',
    avatar:
        'https://assets.teenvogue.com/photos/613b5fd248eda7f19679403c/4:3/w_1999,h_1499,c_limit/1235152164',
    firstName: 'Ricky',
    id: 1,
    lastName: 'Raymond',
    noTelp: '0812345678901',
    username: 'rickyraymond',
  );
}

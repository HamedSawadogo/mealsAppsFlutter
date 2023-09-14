class User{
  String username;
  String password;
  String email;
  User({required this.email,required this.password,required this.username});

  @override
  String toString() {
    return 'User{username: $username, password: $password, email: $email}';
  }
}
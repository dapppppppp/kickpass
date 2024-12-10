class UserDetails {
  String name;
  String email;
  String phone;
  String username;
  String password;
  String photo;

  UserDetails(name, email, phone, username, password, photo)
      : name = name,
        email = email,
        phone = phone,
        username = username,
        password = password,
        photo = photo;
}

// Contoh instansiasi data pengguna langsung
UserDetails user = UserDetails(
  'Munif Hidayat Abdul Jalal',
  'munig123@gmail.com',
  '081234567890',
  'muniff',
  'password123',
  'https://example.com/photo.jpg',
);

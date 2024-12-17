class GatekeeperDetails {
  String name;
  String username;
  String password;
  String role;

  GatekeeperDetails(name, username, password, role)
      : name = name,
        username = username,
        password = password,
        role = role;
}

GatekeeperDetails gatekeeper = GatekeeperDetails(
  'Penjaga',
  'penjaga',
  '12345',
  'gatekeeper',
);

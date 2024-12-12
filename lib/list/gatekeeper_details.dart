class GatekeeperDetails {
  String name;
  String username;
  String password;

  GatekeeperDetails(name, username, password)
      : name = name,
        username = username,
        password = password;
}

GatekeeperDetails gatekeeper = GatekeeperDetails(
  'Penjaga',
  'penjaga',
  '12345',
);

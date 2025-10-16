class Server {
  final String id;
  final String country;
  final String name;
  final int pingMs;
  final bool isMainMyServer;

  Server({
    required this.id,
    required this.country,
    required this.name,
    required this.pingMs,
    this.isMainMyServer = false,
  });
}
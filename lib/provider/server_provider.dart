import 'package:flutter/foundation.dart';
import '../domain/models/server.dart';

enum TabType { all, my, favorites }

class ServerProvider with ChangeNotifier {
  final Server _mainMyServer = Server(
    id: 'shared-my',
    country: 'Мои',
    name: 'Берлин',
    pingMs: 120,
    isMainMyServer: true,
  );

  final List<Server> _allServers = [
    Server(id: 'ber-1', country: 'Германия', name: 'Берлин', pingMs: 120),
    Server(id: 'ber-2', country: 'Германия', name: 'Берлин', pingMs: 120),
    Server(id: 'ber-3', country: 'США', name: 'Берлин', pingMs: 120),
    Server(id: 'ber-4', country: 'США', name: 'Берлин', pingMs: 120),
  ];

  final List<Server> _myServers = [
    Server(id: 'my-1', country: 'Мои', name: 'Берлин', pingMs: 120),
    Server(id: 'my-2', country: 'Мои', name: 'Берлин', pingMs: 120),
  ];

  final Set<String> _favorites = {};
  String? _selectedServerId;
  String _searchQuery = '';
  TabType _activeTab = TabType.all;

  Server get mainMyServer => _mainMyServer;
  List<Server> get allServers => List.unmodifiable(_allServers);
  List<Server> get myServers => [_mainMyServer, ..._myServers];
  Set<String> get favoritesSet => _favorites;
  String? get selectedId => _selectedServerId;
  TabType get activeTab => _activeTab;
  String get searchQuery => _searchQuery;

  void setActiveTab(TabType tab) {
    _activeTab = tab;
    _searchQuery = '';
    notifyListeners();
  }

  void toggleFavorite(String serverId) {
    if (_favorites.contains(serverId)) {
      _favorites.remove(serverId);
    } else {
      _favorites.add(serverId);
    }
    notifyListeners();
  }

  bool isFavorite(String serverId) => _favorites.contains(serverId);

  void selectServer(String serverId) {
    _selectedServerId = serverId;
    notifyListeners();
  }

  void updateSearchQuery(String q) {
    _searchQuery = q;
    notifyListeners();
  }

  List<Server> filteredForTab(TabType tab) {
    final q = _searchQuery.toLowerCase();
    List<Server> base;

    if (tab == TabType.all) {
      base = _allServers;
    } else if (tab == TabType.my) {
      base = _myServers;
    } else {
      base = [
        _mainMyServer,
        ..._allServers,
        ..._myServers,
      ].where((s) => _favorites.contains(s.id)).toList();
    }

    if (q.isEmpty) return base;
    return base.where((s) => s.name.toLowerCase().contains(q)).toList();
  }
}
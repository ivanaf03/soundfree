import 'package:sqflite/sqflite.dart';

class DatabaseTables {
  DatabaseTables._();

  static Future<void> createTables(Database db) async {
    await _createSongTable(db);
    await _createPlaylistTable(db);
    await _createPlaylistSongTable(db);
  }

  static Future<void> _createSongTable(Database db) async {
    await db.execute('''
      CREATE TABLE Song (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        youtube_id TEXT NOT NULL UNIQUE,
        title TEXT NOT NULL,
        artist TEXT NOT NULL,
        duration INTEGER NOT NULL,
        thumbnail_url TEXT,
      )
    ''');

    await db.execute('CREATE INDEX idx_youtube_id ON Song(youtube_id)');
    await db.execute('CREATE INDEX idx_added_date ON Song(added_date)');
  }

  static Future<void> _createPlaylistTable(Database db) async {
    await db.execute('''
      CREATE TABLE Playlist (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT,
        created_date INTEGER NOT NULL,
        updated_date INTEGER NOT NULL,
        thumbnail_url TEXT,
      )
    ''');

    await db.execute(
      'CREATE INDEX idx_playlist_created ON Playlist(created_date)',
    );
  }

  static Future<void> _createPlaylistSongTable(Database db) async {
    await db.execute('''
      CREATE TABLE PlaylistSong (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        playlist_id INTEGER NOT NULL,
        song_id INTEGER NOT NULL,
        FOREIGN KEY (playlist_id) REFERENCES Playlist(id) ON DELETE CASCADE,
        FOREIGN KEY (song_id) REFERENCES Song(id) ON DELETE CASCADE,
        UNIQUE(playlist_id, song_id)
      )
    ''');

    await db.execute(
      'CREATE INDEX idx_playlist_songs ON PlaylistSong(playlist_id)',
    );
    await db.execute(
      'CREATE INDEX idx_song_playlists ON PlaylistSong(song_id)',
    );
  }
}

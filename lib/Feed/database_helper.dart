import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = p.join(dbPath, 'feeds.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
            '''
          CREATE TABLE feeds(
            feed_id INTEGER PRIMARY KEY AUTOINCREMENT,
            feed_content TEXT,
            feed_created_at TEXT,
            feed_user_id INTEGER,
            feed_challenge_id INTEGER
          )
          '''
        );
      },
    );
  }

  Future<void> insertFeed(String content, int userId, int challengeId) async {
    final db = await database;
    await db.insert(
      'feeds',
      {
        'feed_content': content,
        'feed_created_at': DateTime.now().toIso8601String(),
        'feed_user_id': userId,
        'feed_challenge_id': challengeId,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getFeeds() async {
    final db = await database;
    return await db.query('feeds');
  }
}
import 'package:kcalm/model/objects/UserProfile.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:kcalm/model/support/Constants.dart';
import 'package:kcalm/model/objects/Enums.dart';

class DatabaseManager{

  final String? _percorso;
  Database? _database;

  DatabaseManager({String? percorso}) : _percorso = percorso;

  ///Apre il db per la prima volta
  Future<Database> _initDatabase() async {
    final aperto = _database;
    if (aperto != null) return aperto;

    final percorso = _percorso ?? join(
      (await getApplicationDocumentsDirectory()).path,
      ConfigDatabase.nome,
    );

    final database = await openDatabase(
      percorso,
      version: ConfigDatabase.versione,
      onConfigure: _onConfigure,
      onCreate: _onCreate,
    );

    _database = database;
    return database;
  }

  ///attivaione chiavi esterne nel db
  Future<void> _onConfigure(Database db) async{
    await db.execute('PRAGMA foreign_keys = ON');
  }

  ///parte la prima volta, quando il file del db non esiste ancora
  Future<void> _onCreate(Database db, int version) async{
    await db.execute('''
      CREATE TABLE profilo (
        id                 INTEGER PRIMARY KEY CHECK (id = 1),
        sesso              TEXT    NOT NULL CHECK (sesso IN ('uomo', 'donna')),
        data_nascita_ms    INTEGER NOT NULL,
        altezza_cm         REAL    NOT NULL CHECK (altezza_cm > 0),
        peso_iniziale_kg   REAL    NOT NULL CHECK (peso_iniziale_kg > 0),
        peso_obiettivo_kg  REAL    NOT NULL CHECK (peso_obiettivo_kg > 0),
        attivita           TEXT    NOT NULL CHECK (attivita IN ('sedentario', 'leggermenteAttivo', 'moderato', 'moltoAttivo')),
        obiettivo          TEXT    NOT NULL CHECK (obiettivo IN ('dimagrire', 'mantenere', 'aumentare'))
      );
    ''');
    await db.execute('''
      CREATE TABLE alimenti (
        id               INTEGER PRIMARY KEY AUTOINCREMENT,
        codice_barre     TEXT    UNIQUE,
        nome             TEXT    NOT NULL,
        marca            TEXT,
        unita            TEXT    NOT NULL DEFAULT 'g' CHECK (unita IN ('g', 'ml')),
        kcal_100         REAL    NOT NULL CHECK (kcal_100 >= 0),
        carboidrati_100  REAL    NOT NULL CHECK (carboidrati_100 >= 0),
        proteine_100     REAL    NOT NULL CHECK (proteine_100 >= 0),
        grassi_100       REAL    NOT NULL CHECK (grassi_100 >= 0)
      );
    ''');
    await db.execute('''
      CREATE TABLE diario (
        id             INTEGER PRIMARY KEY AUTOINCREMENT,
        alimento_id    INTEGER NOT NULL REFERENCES alimenti(id) ON DELETE RESTRICT,
        pasto          TEXT    NOT NULL CHECK (pasto IN ('colazione', 'pranzo', 'cena', 'spuntino')),
        quantita       REAL    NOT NULL CHECK (quantita > 0),
        kcal           REAL    NOT NULL CHECK (kcal >= 0),
        carboidrati_g  REAL    NOT NULL CHECK (carboidrati_g >= 0),
        proteine_g     REAL    NOT NULL CHECK (proteine_g >= 0),
        grassi_g       REAL    NOT NULL CHECK (grassi_g >= 0),
        data_ms        INTEGER NOT NULL,
        registrato_ms  INTEGER NOT NULL
      );
    ''');
    await db.execute('''
      CREATE INDEX idx_diario_data ON diario(data_ms);
    ''');
    await db.execute('''
      CREATE TABLE pesi (
        id             INTEGER PRIMARY KEY AUTOINCREMENT,
        peso_kg        REAL    NOT NULL CHECK (peso_kg > 0),
        data_ms        INTEGER NOT NULL,
        registrato_ms  INTEGER NOT NULL
      );
    ''');
    await db.execute('''
       CREATE INDEX idx_pesi_data ON pesi(data_ms);
    ''');
    await db.execute('''
      CREATE TABLE passi (
        data_ms  INTEGER PRIMARY KEY,
        passi    INTEGER NOT NULL CHECK (passi >= 0)
      );
    ''');
  }

  ///controllo che le tabelle esistano
  Future<List<String>> nomiTabelle() async{
    final db = await _initDatabase();
    final righe = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type = ? AND name NOT LIKE 'sqlite_%'",
      ['table'],
    );
    return righe.map((riga) => riga['name'] as String).toList();
  }

  ///cntrollo che le chiavi esterne siano attive
  Future<bool> chiaviEsterneAttive() async{
    final db = await _initDatabase();
    final righe = await db.rawQuery('PRAGMA foreign_keys');
    return righe.first['foreign_keys'] == 1;
  }

  ///crea profilo
  Future<void> creaProfilo(UserProfile profilo) async{
    final db = await _initDatabase();
    final oggi = DateTime.now();
    final giorno = DateTime(oggi.year, oggi.month, oggi.day);

    await db.transaction((tn) async{
      await tn.insert('profilo',{
        'id':1,
        'sesso': profilo.sesso.name,
        'data_nascita_ms': profilo.dataNascita.millisecondsSinceEpoch,
        'altezza_cm': profilo.altezzaCm,
        'peso_iniziale_kg': profilo.pesoKg,
        'peso_obiettivo_kg': profilo.pesoObiettivoKg,
        'attivita': profilo.attivita.name,
        'obiettivo': profilo.obiettivo.name
      });
      await tn.insert('pesi', {
        'peso_kg': profilo.pesoKg,
        'data_ms': giorno.millisecondsSinceEpoch,
        'registrato_ms': oggi.millisecondsSinceEpoch
      });
    });
  }

  ///carica profilo
  Future<UserProfile?> caricaProfilo() async{
    final db = await _initDatabase();

    final righe = await db.rawQuery('SELECT * FROM profilo WHERE id = ?', [1]);
    if(righe.isEmpty) return null;
    final riga = righe.first;
    final pesate = await db.rawQuery(
      'SELECT peso_kg FROM pesi ORDER BY data_ms DESC, registrato_ms DESC, id DESC LIMIT 1'
    );
    //se esiste una pesata usa quella altrimenti è il peso iniziale
    final pesoAttuale = (pesate.isNotEmpty ? pesate.first['peso_kg']
    : riga['peso_iniziale_kg']) as num;

    return UserProfile(
      sesso: Sex.values.byName(riga['sesso'] as String),
      dataNascita:
        DateTime.fromMillisecondsSinceEpoch(riga['data_nascita_ms'] as int),
          altezzaCm: (riga['altezza_cm'] as num).toDouble(),
          pesoKg: pesoAttuale.toDouble(),
          attivita: ActivityLevel.values.byName(riga['attivita'] as String),
          obiettivo: Goal.values.byName(riga['obiettivo'] as String),
          pesoObiettivoKg: (riga['peso_obiettivo_kg'] as num).toDouble()
    );
  }

  ///aggiungi pesata
  Future<void> aggiungiPesata(double peso) async{
    final db = await _initDatabase();
    final oggi = DateTime.now();
    final giorno = DateTime(oggi.year, oggi.month, oggi.day);

    await db.insert('pesi', {
      'peso_kg': peso,
      'data_ms': giorno.millisecondsSinceEpoch,
      'registrato_ms': oggi.millisecondsSinceEpoch
    });
  }

  ///aggiorno il profilo
  Future<void> aggiornaProfilo(UserProfile profilo) async {
    final db = await _initDatabase();

    await db.update(
      'profilo',
      {
        'sesso': profilo.sesso.name,
        'data_nascita_ms': profilo.dataNascita.millisecondsSinceEpoch,
        'altezza_cm': profilo.altezzaCm,
        'peso_obiettivo_kg': profilo.pesoObiettivoKg,
        'attivita': profilo.attivita.name,
        'obiettivo': profilo.obiettivo.name
      },
      where: 'id = ?',
      whereArgs: [1],
    );
  }

  ///chiusura db
  Future<void> chiudi() async{
    await _database?.close();
    _database = null;
  }

}
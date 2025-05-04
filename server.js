const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

// Middleware
app.use(bodyParser.json());

// Database setup
const db = new sqlite3.Database(':memory:', (err) => {
    if (err) {
        console.error(err.message);
    } else {
        console.log('Connected to the in-memory SQLite database.');
        db.serialize(() => {
            // Create tables
            db.run(`CREATE TABLE Movies (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                title TEXT NOT NULL,
                genre TEXT,
                duration INTEGER,
                release_date TEXT
            )`);

            db.run(`CREATE TABLE Showtimes (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                movie_id INTEGER,
                showtime TEXT,
                FOREIGN KEY (movie_id) REFERENCES Movies(id)
            )`);

            db.run(`CREATE TABLE Tickets (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                showtime_id INTEGER,
                user_name TEXT,
                seats INTEGER,
                FOREIGN KEY (showtime_id) REFERENCES Showtimes(id)
            )`);
        });
    }
});

// Routes
app.get('/movies', (req, res) => {
    db.all('SELECT * FROM Movies', [], (err, rows) => {
        if (err) {
            res.status(500).json({ error: err.message });
        } else {
            res.json(rows);
        }
    });
});

app.post('/book-ticket', (req, res) => {
    const { showtime_id, user_name, seats } = req.body;
    const sql = 'INSERT INTO Tickets (showtime_id, user_name, seats) VALUES (?, ?, ?)';
    db.run(sql, [showtime_id, user_name, seats], function(err) {
        if (err) {
            res.status(500).json({ error: err.message });
        } else {
            res.json({ message: 'Ticket booked successfully', ticketId: this.lastID });
        }
    });
});

// Start server
app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});

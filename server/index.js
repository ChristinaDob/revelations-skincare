const express = require('express');
const massive = require('massive');
const session = require('express-session');
require('dotenv').config();
const app = express();

const { SERVER_PORT, CONNECTION_STRING, SESSION_SECRET } = process.env;
app.use(express.json());

massive(process.env.CONNECTION_STRING)
  .then(db => {
    app.set('db', db);
    console.log(`Connected to my data base.`);
  })
  .catch(err => console.log(`ERROR: Could not connect to the database.`));

// session
app.use(
  session({
    secret: SESSION_SECRET,
    resave: false,
    saveUninitialized: false,
    cookie: {
      maxAge: 1000 * 60 * 60 * 24 * 14
    }
  })
);

/* ------  Endpoints ------ */

app.listen(SERVER_PORT, () =>
  console.log(`My server is running on port: ${SERVER_PORT}.`)
);

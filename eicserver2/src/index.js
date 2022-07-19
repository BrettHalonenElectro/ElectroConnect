require('dotenv').config()
const cors = require('cors')
const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const { postgraphile } = require('postgraphile')
const { identifier } = require('pg-sql2')

const { PORT } = 8080;

app.use(cors())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(
    postgraphile(process.env.DATABASE_URL, "eicprodpublic", {
        watchPg: true,
        graphiql: true,
        enhanceGraphiql: true,
        jwtPgTypeIdentifier: "eicprodpublic.jwt_token",
        jwtSecret: "superSecretRandom",

    })
);

app.listen(3000, () => console.log(`Server running on port ${PORT}`))
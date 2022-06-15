const express = require('express');
const Podlet = require('@podium/podlet');
const { name, version } = require('./package.json');

const app = express();

const podlet = new Podlet({
    name,
    version,
    pathname: '/',
    development: true,
});

app.use(podlet.middleware());

app.get(podlet.content(), (req, res) => {
    res.status(200).podiumSend(`<h2>Hello world</h2>`);
});

app.get(podlet.manifest(), (req, res) => {
    res.status(200).json(podlet);
});

app.listen(7100);

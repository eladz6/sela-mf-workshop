const express = require('express');
const Layout = require('@podium/layout');

const layout = new Layout({
    name: 'webshop',
    pathname: '/',
});

const blue = layout.client.register({
    name: 'blue',
    uri: 'http://localhost:7100/manifest.json',
});

const red = layout.client.register({
    name: 'red',
    uri: 'http://localhost:7200/manifest.json',
});

const green = layout.client.register({
    name: 'green',
    uri: 'http://localhost:7300/manifest.json',
});

const app = express();

app.use(layout.middleware());

app.get(layout.pathname(), async (req, res, next) => {
    const incoming = res.locals.podium;

    const [r, g, b] = await Promise.all([
        red.fetch(incoming),
        green.fetch(incoming),
        blue.fetch(incoming),
    ]);

    res.podiumSend(`
        <section>${r.content}</section>
        <section>${g.content}</section>
        <section>${b.content}</section>
    `);
});

app.listen(7000);

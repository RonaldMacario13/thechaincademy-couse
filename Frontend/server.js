// Connect Metamask
const express = require("express");
const path = require("path");
const app = express();

// Configurar o middleware para servir arquivos estáticos
app.use(express.static(path.join(__dirname)));

// Rota para servir o arquivo index.html
app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "index.html"));
});

// Iniciar o servidor na porta 5000
const server = app.listen(5000, () => {
    const portNumber = server.address().port;
    console.log(`Server is running on port ${portNumber}`);
});
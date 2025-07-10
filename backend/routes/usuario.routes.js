"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.UsuarioRoutes = void 0;
const express_1 = require("express");
const usuario_controller_1 = require("../controllers/usuario.controller");
class UsuarioRoutes {
    constructor() {
        this.router = (0, express_1.Router)();
        this.config();
    }
    config() {
        // Listar
        this.router.get("/", usuario_controller_1.usuarioController.listar);
    }
}
exports.UsuarioRoutes = UsuarioRoutes;
const usuarioRoutes = new UsuarioRoutes();
exports.default = usuarioRoutes.router;

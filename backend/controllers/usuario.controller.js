"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.usuarioController = void 0;
const usuario_database_1 = __importDefault(require("../database/usuario.database"));
class UsuarioController {
    listar(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                var usuarios = yield usuario_database_1.default.listar();
                for (let usuario of usuarios) {
                    usuario.roles = yield usuario_database_1.default.listarRolByUserId(usuario.cveUsuario);
                }
                res.json(usuarios);
            }
            catch (error) {
                console.log(error);
                return res.status(500).json({ mensaje: 'Ocurrió un error' });
            }
        });
    }
}
exports.usuarioController = new UsuarioController();

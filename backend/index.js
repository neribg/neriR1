"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const morgan_1 = __importDefault(require("morgan"));
const cors_1 = __importDefault(require("cors"));
const index_routes_1 = __importDefault(require("./routes/index.routes"));
const auth_routes_1 = __importDefault(require("./routes/auth.routes"));
const usuario_routes_1 = __importDefault(require("./routes/usuario.routes"));
class Server {
    constructor() {
        this.app = (0, express_1.default)();
        this.config();
        this.routes();
    }
    config() {
        // realizar la configuración del puerto
        this.app.set("port", process.env.PORT || 3000);
        // Mostrar las peticiones en la terminal (morgan)
        this.app.use((0, morgan_1.default)("dev"));
        // Configurar el intercambio de recursos de origen (cors)
        this.app.use((0, cors_1.default)());
        // Configurar la entrada de datos por medio de las peticiones (json)
        this.app.use(express_1.default.json());
        // Deshabilitar la opción de envio de URL corruptas
        this.app.use(express_1.default.urlencoded({ extended: true }));
    }
    routes() {
        this.app.use("/", index_routes_1.default);
        this.app.use("/api/auth", auth_routes_1.default);
        this.app.use("/api/usuario", usuario_routes_1.default);
    }
    start() {
        // Agregar un listener con un callback para ejecutar el servicio
        this.app.listen(this.app.get("port"), () => {
            console.log(`Server on port ${this.app.get("port")}`);
        });
    }
}
const server = new Server();
server.start();

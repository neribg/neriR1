"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const auth_controller_1 = require("../controllers/auth.controller");
const auth_rules_1 = require("../validators/auth.rules");
const validator_check_1 = require("../middlewares/validator.check");
class AuthRoutes {
    constructor() {
        this.router = (0, express_1.Router)();
        this.config();
    }
    config() {
        this.router.post("/", (0, auth_rules_1.authValidatorRules)(), [validator_check_1.validate], auth_controller_1.authController.login);
    }
}
const authRoutes = new AuthRoutes();
exports.default = authRoutes.router;

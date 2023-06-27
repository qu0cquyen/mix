"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = __importDefault(require("express"));
var cors_1 = __importDefault(require("cors"));
var app = (0, express_1.default)();
// Parse Json
app.use(express_1.default.json());
// CORS
app.use((0, cors_1.default)());
// Routes definition
app.use('/', require('./routes'));
var PORT = process.env.PORT || 8080;
app.listen(PORT, function () {
    console.log("Server is running on port: ".concat(PORT));
});
//# sourceMappingURL=index.js.map
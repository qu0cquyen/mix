"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = __importDefault(require("express"));
var router = express_1.default.Router();
router.post('/', function (req, res) {
    var body = req.body;
    console.log(req.body);
    return res.send(req.body);
});
module.exports = router;
//# sourceMappingURL=index.js.map
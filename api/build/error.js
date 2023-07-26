"use strict";
/* Operational Error:
   Represent runtime problems whose results are expected and should be dealt
   with in a proper way. Operational errors don't mean the application itself has bugs
   but developers need to handle them thoughtfully. Examples of operational errors
   include "out of memory", "an invalid input for an API endpoint", and so on..
*/
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (g && (g = 0, op[0] && (_ = 0)), _) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.errorHandler = exports.HttpStatusCode = void 0;
var BaseError = /** @class */ (function (_super) {
    __extends(BaseError, _super);
    function BaseError(name, httpCode, description, isOperational) {
        var _newTarget = this.constructor;
        var _this = _super.call(this, description) || this;
        Object.setPrototypeOf(_this, _newTarget.prototype);
        _this.name = name;
        _this.httpCode = httpCode;
        _this.isOperational = isOperational;
        Error.captureStackTrace(_this);
        return _this;
    }
    return BaseError;
}(Error));
var APIError = /** @class */ (function (_super) {
    __extends(APIError, _super);
    function APIError(name, httpCode, isOperational, description) {
        if (httpCode === void 0) { httpCode = HttpStatusCode.INTERNAL_SERVER; }
        if (isOperational === void 0) { isOperational = true; }
        if (description === void 0) { description = 'Internal Server Error'; }
        return _super.call(this, name, httpCode, description, isOperational) || this;
    }
    return APIError;
}(BaseError));
var ErrorHandler = /** @class */ (function () {
    function ErrorHandler() {
    }
    ErrorHandler.prototype.handleError = function (err) {
        return __awaiter(this, void 0, void 0, function () {
            return __generator(this, function (_a) {
                console.log(err);
                return [2 /*return*/];
            });
        });
    };
    ErrorHandler.prototype.isTrustedError = function (error) {
        if (error instanceof BaseError) {
            return error.isOperational;
        }
        return false;
    };
    return ErrorHandler;
}());
var HttpStatusCode;
(function (HttpStatusCode) {
    HttpStatusCode[HttpStatusCode["OK"] = 200] = "OK";
    HttpStatusCode[HttpStatusCode["BAD_REQUEST"] = 400] = "BAD_REQUEST";
    HttpStatusCode[HttpStatusCode["PERMISSION_DENIED"] = 403] = "PERMISSION_DENIED";
    HttpStatusCode[HttpStatusCode["NOT_FOUND"] = 404] = "NOT_FOUND";
    HttpStatusCode[HttpStatusCode["INTERNAL_SERVER"] = 500] = "INTERNAL_SERVER";
})(HttpStatusCode || (exports.HttpStatusCode = HttpStatusCode = {}));
exports.errorHandler = new ErrorHandler();
/* Programmer Error
   Represent unexpected bugs in poorly written code. They mean the
   code itself has some issues to solve and was coded wrong. A good
   example is to try to read a property of "undefined". To fix the
   issue, the code has to be changed. That is a bug developer made,
   not an operational error.
*/
/*
    Handle Programmer Errors
    The best way to deal with these errors is to crash immediately
    and restart gracefully with an automatic restarter like PM2
    The reason being that programmer errors are unexpected, as
    they are actual bugs that might cause the application to end up
    in a wrong state and behave in an unpexted way
*/
process.on('uncaughtException', function (error) {
    exports.errorHandler.handleError(error);
    if (!exports.errorHandler.isTrustedError(error)) {
        process.exit(1);
    }
});
/*
    Dealing with unhandled promise rejections and execeptions
*/
process.on('unhandledRejection', function (reason, promise) {
    throw reason;
});
/*
    Example of using Error:
    User.getUserById(1).then((firstUser) => {
        if(firstUser.isSleeping === false) throw new Error('He is not sleeping');
    })
*/ 
//# sourceMappingURL=error.js.map
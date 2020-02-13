const OverlayHook = require("./node-ovhook");
const ElectronOverlay = require("./electron-overlay");

module.exports = {
  IGameOverlayHook: OverlayHook,
  IGameOverlay: ElectronOverlay
};

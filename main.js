const shell = require('shelljs');
const request = require('request');
const fs = require('fs');
const prompt = require("prompt-sync")({ sigint: true });

const { Signale } = require('signale');
const logger = new Signale({ scope: 'VPN-Client' });

logger.success('Launching...');

var usernameInput = prompt('Username: ');
var passwordInput = prompt('Password: ');

var formData = {
    username: usernameInput,
    password: passwordInput
};
  
request.post('https://auth.ggs-network.de/auth/ovpn', {form: formData}).pipe(fs.createWriteStream('./client.ovpn'))


shell.exec('openvpn --config client.ovpn');
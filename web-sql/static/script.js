    function htmlEncode(str) {
        return String(str).replace(/[||;'"<>&\r\n\\]/gi, function (c) {
             var lookup = {'||': '', ';': '', '\\': '', '\r': '', '\n': '', '"': '', '<': '', '>': '', "'": '', '&': ''};
            return lookup[c];
        });
    }  
  const log = (text, color) => {
    document.getElementById('log').innerHTML += `<span style="color: ${color}">${text}</span><br>`;
  };

  const socket = new WebSocket('ws://' + location.host + '/echo');
  socket.addEventListener('message', ev => {
    log('<  ' + ev.data, 'blue');
  });
  document.getElementById('form').onsubmit = ev => {
    ev.preventDefault();
    const textField = document.getElementById('text');
    log('>  ' + htmlEncode(textField.value), 'red');
    socket.send(htmlEncode(textField.value));
    textField.value = '';
  };
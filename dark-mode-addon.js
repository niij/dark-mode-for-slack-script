
//This enabled or disables dark mode
var fs = require('fs');
const path = require("path");
fs.readFile(path.resolve(__dirname, '../../../dark-mode-toggle.pref'), function (err, data) {
  if (err) throw err;
  if(data.indexOf('enabled') >= 0){
    console.log("Dark mode enabled");
    document.addEventListener('DOMContentLoaded', function() {
     $.ajax({
       url: 'https://cdn.rawgit.com/laCour/slack-night-mode/master/css/raw/black.css',
       success: function(css) {
         let overrides = `
         code { background-color: #535353; color: #85c5ff; } /* Change color: to whatever font color you want */
         .c-mrkdwn__pre, .c-mrkdwn__quote { background: #535353 !important; background-color: #535353 !important; }
         `
         $("<style></style>").appendTo('head').html(css + overrides);
       }
     });
    });
  };
});

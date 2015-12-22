Package.describe({
  name: 'is-frontend',
  version: '0.0.2',
  summary: 'iSchedule browser and mobile views',
  git: '',
  documentation: 'README.md'
});

var findFiles = function(dir, ext) {
  if(ext == undefined) ext = 'coffee';
  if(process.env.PWD.match(/packages/)) var name = '';
  else var name = 'packages/is-frontend/';
  var glob = Npm.require("glob");
  var list = [];
  glob.sync(name + dir + '/**/*.' + ext).forEach(function(path){ list.push(path.replace(name, '')); });
  return list.sort().reverse();
}

var webClient     = ['web.browser'];
var cordovaClient = ['web.cordova'];

// var webClient     = [];
// var cordovaClient = ['web.browser', 'web.cordova'];

Package.onUse(function(api) {
  api.versionsFrom('1.2.1');

  // shared
  api.use([
    'ecmascript',
    'underscore',
    'coffeescript',
    'is-season',
    'is-collections',
    'sacha:spin@2.3.1',
    'mquandalle:jade@0.4.5',
    'iron:router@1.0.12',
    'blaze-html-templates@1.0.1',
  ]);

  // web
  api.use([
    'aldeed:autoform',
    'anti:modals@0.4.0',
    'huttonr:bootstrap3',
    'ian:accounts-ui-bootstrap-3',
    'mrt:flash-messages@1.0.1',
    'less',
    'accounts-password',
    'accounts-google',
  ], webClient);

  // mobile
  api.use([
    'meteoric:ionic@0.1.19',
    'meteoric:autoform-ionic',
    'useraccounts:ionic',
    'meteoric:ionic-sass@0.3.0',
    'meteoric:ionicons-sass@0.1.7',
  ], cordovaClient);

  // libs
  api.addFiles(
    findFiles('lib')
  );
  api.addFiles(
    findFiles('browser/lib'), webClient
  );

  // shared
  api.addFiles(
    findFiles('browser/client/views', 'jade'), webClient
  );
  api.addFiles(
    findFiles('cordova/client/views', 'jade'), cordovaClient
  );
  api.addFiles(
    findFiles('shared/client').sort(), 'client'
  );

  // web.browser
  api.addFiles(
    findFiles('browser/client').sort(), webClient
  );
  api.addFiles([
    'browser/client/stylesheets/bootstrap-settings.json',
  ], webClient);

  // web.cordova
  api.addFiles(
    findFiles('cordova/client').sort(), cordovaClient
  );
  api.addFiles([
    'cordova/client/stylesheets/app.scss',
  ], cordovaClient);
});

Package.onTest(function(api) {
  api.use([
    'ecmascript',
    'tinytest',
    'underscore',
    'coffeescript',
    'is-frontend',
  ]);
});

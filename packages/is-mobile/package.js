Package.describe({
  name: 'is-mobile',
  version: '0.0.1',
  summary: 'iSchedule mobile views',
  git: '',
  documentation: 'README.md'
});

var findFiles = function(dir, ext) {
  if(ext == undefined) ext = 'coffee';
  if(process.env.PWD.match(/packages/)) var name = '';
  else var name = 'packages/is-mobile/';
  var glob = Npm.require("glob");
  var list = []; 
  glob.sync(name + dir + '/**/*.' + ext).forEach(function(path){ list.push(path.replace(name, '')); });
  return list.sort().reverse();
}

Package.onUse(function(api) {
  api.versionsFrom('1.2.1');

  api.use([
    'ecmascript',
    'underscore',
    'coffeescript',
    'is-season',
    'is-collections',
    'iron:router',
    'mquandalle:jade',
    'meteoric:ionic-sass@0.3.0',
    'meteoric:ionicons-sass@0.1.7',
  ]);

  api.use([
    'meteoric:ionic@0.1.19',
    'meteoric:autoform-ionic',
    'useraccounts:ionic',
  ], 'web.cordova');

  api.addFiles(
    findFiles('lib')
  );
  api.addFiles(
    findFiles('client/views', 'jade'),
    'web.cordova'
  );
  api.addFiles(
    findFiles('client').sort(),
    'web.cordova'
  );
  api.addFiles([
    'client/stylesheets/app.scss',
  ], 'web.cordova');
});

Package.onTest(function(api) {
  api.use([
    'ecmascript',
    'tinytest',
    'underscore',
    'coffeescript',
    'is-mobile',
  ]);
});

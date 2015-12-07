Package.describe({
  name: 'is-web',
  version: '0.1.0',
  summary: 'iSchedule browser app',
  git: '',
  documentation: 'README.md'
});

var findFiles = function(dir) {
  if(process.env.PWD.match(/packages/)) var name = '';
  else var name = 'packages/is-web/';
  var glob = Npm.require("glob");
  var list = []; 
  glob.sync(name + dir + '/**/*.{coffee,jade}').forEach(function(path){ list.push(path.replace(name, '')); });
  return list.sort().reverse();
}

Package.onUse(function(api) {
  api.versionsFrom('1.2.1');

  api.use([
    'ecmascript',
    'underscore',
    'coffeescript',
    'is-season',
    'iron:router@1.0.12',
    'blaze-html-templates@1.0.1',
    'mquandalle:jade@0.4.5'
  ]);

  api.addFiles(
    findFiles('lib'), 'client'
  );
  api.addFiles(
    findFiles('client').sort(), 'client'
  );
});

Package.onTest(function(api) {
  api.use([
    'ecmascript',
    'tinytest',
    'underscore',
    'coffeescript',
    'is-web',
  ]);
});

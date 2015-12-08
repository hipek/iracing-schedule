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
  ]);

  api.addFiles(
    findFiles('lib')
  );
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

Package.describe({
  name: 'is-collections',
  version: '0.1.0',
  summary: 'iSchedule Collections',
  git: '',
  documentation: 'README.md'
});

var findFiles = function(dir) {
  if(process.env.PWD.match(/packages/)) var name = '';
  else var name = 'packages/is-collections/';
  var glob = Npm.require("glob");
  var list = []; 
  glob.sync(name + dir + '/**/*.coffee').forEach(function(path){ list.push(path.replace(name, '')); });
  return list.sort().reverse();
}

Package.onUse(function(api) {
  api.versionsFrom('1.2.1');

  api.use([
    'underscore',
    'coffeescript',
    'ecmascript',
    'mongo',
    'aldeed:simple-schema',
    // 'aldeed:collection2@2.5.0',
    // 'aldeed:autoform@5.7.1',
    // 'dburles:collection-helpers@1.0.4'
  ]);

  api.addFiles(
    findFiles('collections')
  );

  api.export([
    'Teams',
  ]);

  api.addFiles(
    findFiles('server'), 'server'
  );
});

Package.onTest(function(api) {
  api.use('ecmascript');
  api.use('tinytest');
  api.use('underscore');
  api.use('coffeescript');
  api.use('is-collections');
});

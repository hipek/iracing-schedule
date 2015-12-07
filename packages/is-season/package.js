Package.describe({
  name: 'is-season',
  version: '0.1.0',
  summary: 'iSchedule Season (seasons, tracks, series, parser)',
  git: '',
  documentation: 'README.md'
});

var findFiles = function(dir) {
  if(process.env.PWD.match(/packages/)) var name = '';
  else var name = 'packages/is-season/';
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
    'mongo',
    'aldeed:simple-schema',
    'aldeed:collection2@2.5.0',
    'aldeed:autoform@5.7.1',
    'dburles:collection-helpers@1.0.4'
  ]);

  api.export([
    'Tracks',
    'Seasons'
  ]);

  api.addFiles(
    findFiles('collections')
  );
  api.addFiles(
    findFiles('extras')
  );

  api.export([
    'SeasonParser',
    'SeasonBuilder'
  ], 'server');
  api.addFiles(
    findFiles('server'), 'server'
  );
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('underscore');
  api.use('coffeescript');
  api.use('is-season');

  api.addFiles([
    'tests/factory.coffee',
    'tests/describe.coffee'
  ]);

  api.addFiles([
    'tests/season/builder_test.coffee',
    'tests/season/season_parser_test.coffee'
  ], 'server');
});

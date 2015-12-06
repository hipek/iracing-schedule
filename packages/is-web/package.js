Package.describe({
  name: 'is-web',
  version: '0.1.0',
  summary: 'iSchedule browser app',
  git: '',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.2.1');

  api.use([
    'ecmascript',
    'underscore',
    'coffeescript',
    'is-season'
  ]);

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

Package.describe({
  name: 'is-web',
  version: '0.1.0',
  summary: 'iSchedule browser app',
  git: '',
  documentation: 'README.md'
});

var findFiles = function(dir, ext) {
  if(ext == undefined) ext = 'coffee';
  if(process.env.PWD.match(/packages/)) var name = '';
  else var name = 'packages/is-web/';
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
    'less',
    'iron:router@1.0.12',
    'blaze-html-templates@1.0.1',
    'mquandalle:jade@0.4.5',
    'aldeed:autoform@5.7.1',
    'mrt:flash-messages@1.0.1',
    'sacha:spin',
    'anti:modals@0.4.0',
    'accounts-password',
    'accounts-google',
    'huttonr:bootstrap3',
    'ian:accounts-ui-bootstrap-3'
  ]);

  api.addFiles(
    findFiles('lib'), 'client'
  );
  api.addFiles(
    findFiles('client/views', 'jade'), 'client'
  );
  api.addFiles(
    findFiles('client').sort(), 'client'
  );
  api.addFiles([
    'client/stylesheets/bootstrap-settings.json',
  ], 'client');
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

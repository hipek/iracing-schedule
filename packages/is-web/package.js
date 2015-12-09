Package.describe({
  name: 'is-web',
  version: '0.1.0',
  summary: 'iSchedule browser views',
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
    'is-collections',
    'less',
    'iron:router@1.0.12',
    'blaze-html-templates@1.0.1',
    'mquandalle:jade@0.4.5',
    'mrt:flash-messages@1.0.1',
  ]);

  api.use([
    'accounts-password',
    'accounts-google',
    'aldeed:autoform',
    'sacha:spin@2.3.1',
    'anti:modals@0.4.0',
    'huttonr:bootstrap3',
    'ian:accounts-ui-bootstrap-3'
  ], 'web.browser');

  api.addFiles(
    findFiles('lib')
  );
  api.addFiles(
    findFiles('client/views', 'jade'),
    'web.browser'
  );
  api.addFiles(
    findFiles('client').sort(),
    'web.browser'
  );
  api.addFiles([
    'client/stylesheets/bootstrap-settings.json',
  ], 'web.browser');
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

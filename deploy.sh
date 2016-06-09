#!/bin/bash

NAME='ischedule.tar.gz'
DIR='/home/deploy/nodejs/ischedule'
REMOTE="deploy@$1"
HOST="http://$1"

meteor build .build --server $HOST

ssh $REMOTE "mkdir -p $DIR"

scp .build/$NAME $REMOTE:$DIR
ssh $REMOTE "cd $DIR && tar xfz $NAME"
ssh $REMOTE "rm -rf $DIR/bundle/programs/server/npm/npm-bcrypt"
ssh $REMOTE "cd $DIR/bundle/programs/server && npm install --production && npm install bcrypt"
ssh $REMOTE "mkdir -p $DIR/bundle/tmp $DIR/bundle/public"
ssh $REMOTE "cd $DIR && touch bundle/tmp/restart.txt"

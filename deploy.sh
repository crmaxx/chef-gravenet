#/bin/sh

USER='root'
HOST='gravenet.ru'
DIR='/var/chef'

rsync -r . $USER@$HOST:$DIR
ssh $USER@$HOST "chef-solo -c $DIR/solo.rb"

#!/bin/sh

# requires: 
#  git

unset GIT_DIR
unset GIT_WORK_DIR



quit() {
	rm -rf /tmp/vcsh
	rm -rf ~/.config/vcsh/repo.d/mr.git
	rm -rf ~/.config/mr
	rm -rf ~/.mrconfig
	rm -rf ~/.gitignore.d

	exit $*
}

if [ "$1" = "clean" ]; then
	quit
fi

xfer="cp"

if [ "$1" = "temp" ]; then
	xfer="ln -s"
fi

cd $(dirname $0)/..
mkdir -p ~/.ssh
$xfer $(dirname $0)/../identity/ssh/id_rsa* ~/.ssh

cd /tmp
if [ -d vcsh ]; then
  rm -rf vcsh
fi

git clone git://github.com/RichiH/vcsh vcsh || quit $?
/tmp/vcsh/vcsh clone git@github.com:eddsteel/df-mr.git mr || quit $?

cd ~/.config/mr/config.d
ln -s ../available.d/* .
echo "now remove the repos you don't want."
bash
cd
mr -j5 up || quit $?
rm -rf /tmp/vcsh

# Bootstrap VCSH, mr, and repos.
#

UBUNTU_RE="Linux*Ubuntu*"
DEBIAN_RE="Linux*Debian*"

cd $HOME

case `uname -a` in 
	$UBUNTU_RE)
		APTABLE=true
		;;
	$DEBIAN_RE)
		APTABLE=true
		;;
	*) 
		APTABLE=false
		;;
esac


init_package_man() {
	case `uname -a` in 
		$UBUNTU_RE)
			sudo apt-get update
			;;
		$DEBIAN_RE)
			sudo apt-get update
			;;
		Darwin*)
			ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
			brew update
			;;
		*)
			echo Unsupported
			fail
			;;
	esac
}

install() {
	case `uname -a` in 
		$UBUNTU_RE)
			sudo apt-get -y install $* ;;
		$DEBIAN_RE)
			sudo apt-get -y install $* ;;
		Darwin*)
			brew install $* ;;
		*)
			echo Unsupported
			fail
			;;
	esac
}

check_install() {
	which $1 >/dev/null
	if [$? -gt 0 ]; then
		install $1
	fi
}

## Prepare
init_package_man || (echo "This isn't going to work."; exit 1)

## Check/get git
check_install git

## Check/get mr
check_install mr

## Check/get vcsh
if $APTABLE; then
	install vcsh
else
	mkdir -p Projects/oss
	git clone git://github.com/RichiH/vcsh.git
	cd vcsh
	sudo mkdir -p /usr/local/bin
	sudo ln -s vcsh /usr/local/bin   
	cd
fi

hash -r

vcsh clone git://github.com/eddsteel/df-mr.git mr

install vim zsh tmux

mr up

hash -r
cd .config/mr/available.d
echo "Now link what you need."
exec zsh

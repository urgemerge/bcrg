#!/bin/bash

if ! [ -f "$(which ncat)" ]; then 
	echo "Binary ncat not present. Please install"
	echo
	exit 1
fi

BRCGDIR=$(dirname $(readlink -f $0))

if ! grep -q brcg-load ~/.bashrc; then
	echo
	echo "Adding brcg-load function to ~/.bashrc"

	cat <<EOT >> ~/.bashrc
function brcg-load {
	BRCGDIR=$BRCGDIR
	source \$BRCGDIR/bashrc-global
}

brcg-load
EOT
	echo "Reloading shell"
	bash	
else
	echo
	echo "Already installed"
fi


pkgver=main
pkgname=git
pkgrel=1
mkdeps="zlib-ng-dev:curl-dev:gmake"
deps="zlib-ng:curl"
bad="gmake"
ext="doc"
LICENSE=COPYING

fetch() {
	wget https://github.com/OrangeOperatingSystems/git/archive/refs/heads/main.zip
	unzip $pkgver.zip
}

build() {
	cd $pkgname-$pkgver
	# gmake NO_PERL=1 NO_REGEX=NeedsStartEnd NO_TCLTK=1 NO_MSGFMT_EXTENDED_OPTIONS=1 prefix=/usr gitexecdir=lib/gitcore INSTALL_SYMLINKS=1
	gmake NO_REGEX=NeedsStartEnd NO_TCLTK=1 NO_MSGFMT_EXTENDED_OPTIONS=1 prefix=/usr gitexecdir=lib/gitcore INSTALL_SYMLINKS=1
	# Need to run twice for it to work ¯\_(ツ)_/¯
	# Some issue with `msgfmt` 'cause I'm using gettext-tiny but idk why it works on the second run
	# gmake NO_PERL=1 NO_REGEX=NeedsStartEnd NO_TCLTK=1 NO_MSGFMT_EXTENDED_OPTIONS=1 prefix=/usr gitexecdir=lib/gitcore INSTALL_SYMLINKS=1
	gmake NO_REGEX=NeedsStartEnd NO_TCLTK=1 NO_MSGFMT_EXTENDED_OPTIONS=1 prefix=/usr gitexecdir=lib/gitcore INSTALL_SYMLINKS=1
}

package() {
	cd $pkgname-$pkgver
	# gmake NO_PERL=1 NO_REGEX=NeedsStartEnd NO_TCLTK=1 NO_MSGFMT_EXTENDED_OPTIONS=1 install prefix=/usr gitexecdir=lib/gitcore DESTDIR=$pkgdir INSTALL_SYMLINKS=1
	gmake NO_REGEX=NeedsStartEnd NO_TCLTK=1 NO_MSGFMT_EXTENDED_OPTIONS=1 install prefix=/usr gitexecdir=lib/gitcore INSTALL_SYMLINKS=1
}

package_doc() {
	# gmake NO_PERL=1 NO_REGEX=NeedsStartEnd NO_TCLTK=1 NO_MSGFMT_EXTENDED_OPTIONS=1 install-man prefix=/usr DESTDIR=$pkgdir INSTALL_SYMLINKS=1
	gmake NO_REGEX=NeedsStartEnd NO_TCLTK=1 NO_MSGFMT_EXTENDED_OPTIONS=1 install-man prefix=/usr INSTALL_SYMLINKS=1
}

license() {
	cd $pkgname-$pkgver
	cat $LICENSE
}

pkgver=0.8.5
pkgname=toybox
pkgrel=1
deps="musl:pci-ids"
NO_TAR=1

fetch() {
	curl "http://www.landley.net/toybox/downloads/$pkgname-$pkgver.tar.gz" -o $pkgname-$pkgver.tar.gz
	tar -xf $pkgname-$pkgver.tar.gz
}

build() {
	cd $pkgname-$pkgver
	CPUS=1 make defconfig
	cp ../../.config ./
	CPUS=1 make
}

package() {
	cd $pkgname-$pkgver
	install -d /bin
	install -Dm755 ./toybox /bin/
	ln -sr /bin/toybox /bin/ln
	ln -sr /bin/toybox /bin/uname
	ln -sr /bin/toybox /usr/bin/install
	install -d /usr/bin
	ln -sr /bin/toybox /usr/bin/lspci
	make install

	# Provided by NetBSD Curses
#	rm $pkgdir/usr/bin/clear
#	rm $pkgdir/usr/bin/reset

	# LLVM Provides this
#	rm $pkgdir/usr/bin/readelf
#	rm $pkgdir/usr/bin/tar
}

license() {
	cd $pkgname-$pkgver
	cat LICENSE
}

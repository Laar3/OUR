pkgname=byacc
pkgver=20210808
LICENSE=LICENSE

fetch() {
        curl -L "https://invisible-island.net/datafiles/release/byacc.tar.gz" -o $pkgname-$pkgver.tar.gz
	tar -xf $pkgname-$pkgver.tar.gz
}

build() {
        cd $pkgname-$pkgver
        ./configure --prefix=/usr
        make
}

package() {
        cd $pkgname-$pkgver
        make install
        rm -rf byacc*
}

license() {
        cd $pkgname-$pkgver
        cat $LICENSE
}


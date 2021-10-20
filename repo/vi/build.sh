pkgname=ex
pkgver=050325
LICENSE=LICENSE

fetch() {
        curl -l "http://prdownloads.sourceforge.net/ex-vi/ex-050325.tar.bz2" -o $pkgname-$pkgver.tar.gz
        tar -xf $pkgname-$pkgver.tar.gz
}

build() {
        cd $pkgname-$pkgver
}

package() {
        cd $pkgname-$pkgver
}

license() {
        cd $pkgname-$pkgver
        cat $LICENSE
}

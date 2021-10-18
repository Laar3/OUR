pkgname=zlib
pkgver=1.2.11
LICENSE=README

fetch() {
        curl -l "https://www.zlib.net/zlib-1.2.11.tar.gz" -o $pkgname-$pkgver.tar.gz
        tar -xf $pkgname-$pkgver.tar.gz
}

build() {
        cd $pkgname-$pkgver
        ./configure
        make
}

package() {
        cd $pkgname-$pkgver
        doas make install
}

license() {
        cd $pkgname-$pkgver
        cat $LICENSE
}
fetch
build
package
license


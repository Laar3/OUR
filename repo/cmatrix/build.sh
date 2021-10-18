pkgname=cmatrix
pkgver=2.0
LICENSE=COPYING

fetch() {
        curl -L "https://github.com/abishekvashok/cmatrix/releases/download/v2.0/cmatrix-v2.0-Butterscotch.tar" -o $pkgname-$pkgver.tar.gz
        tar -xf $pkgname-$pkgver.tar.gz
}

build() {
        cd $pkgname
        ./configure
        make
}

package() {
        cd $pkgname
        doas make install
}

license() {
        cd $pkgname
        cat $LICENSE
}
fetch
build
package
#license


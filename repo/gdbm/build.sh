pkgname=gdbm
pkgver=1.21
LICENSE=COPYING

fetch() {
        curl -l "https://ftp.gnu.org/gnu/gdbm/gdbm-1.21.tar.gz" -o $pkgname-$pkgver.tar.gz
        tar -xf $pkgname-$pkgver.tar.gz
}

build() {
        cd $pkgname-$pkgver
        ./configure --enable-libgdbm-compat COMPATINCLUDEDIR=/usr/include/gdbm
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

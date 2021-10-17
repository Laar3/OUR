pkgname=flex
pkgver=2.6.4
LICENSE=COPYING

fetch() {
        curl -L "https://github.com/westes/flex/files/981163/flex-2.6.4.tar.gz" -o $pkgname-$pkgver.tar.gz
        tar -xf $pkgname-$pkgver.tar.gz
}

build() {
        cd $pkgname-$pkgver 
        ./autogen.sh
        ./configure 
        make
}

package() {
        cd $pkgname-$pkgver
        make install
}

license() {
	# Only changes that you possibly need to do but not neccesarily is that you change the folder to the one that is the equivilent of the
	# zip's or tar's folder.
        cd $pkgname-$pkgver
        cat $LICENSE
}
fetch
build
package
license


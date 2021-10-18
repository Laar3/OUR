pkgname=ruby
pkgver=3.0.2
LICENSE="COPYING LEGAL"

fetch() {
        curl -l "https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.2.tar.gz" -o $pkgname-$pkgver.tar.gz
        tar -xf $pkgname-$pkgver.tar.gz
}

build() {
        cd $pkgname-$pkgver
        ./configure
        make
}

package() {
        cd $pkgname-$pkgver
        make install
}

license() {
        cd $pkgname-$pkgver
        cat $LICENSE
}
fetch
build
package
license


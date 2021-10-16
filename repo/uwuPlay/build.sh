pkgname=uwuPlay
pkgver=master
LICENSE=LICENSE

fetch() {
    git clone https://github.com/breadtard/uwuTools --depth 1 --jobs 5
    cp -r uwuTools/$pkgname ./
    rm -rf uwuTools
}

build() {
    cd $pkgname
    echo "Nothing to do"
}

package() {
    cd $pkgname
    install -Dm755 uwuplay /usr/bin/
}

license() {
    cd $pkgname
    cat $LICENSE
}

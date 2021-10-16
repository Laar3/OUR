pkgname=uwuEdit
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
	./install.sh
}

license() {
	cd $pkgname
	cat $LICENSE
}

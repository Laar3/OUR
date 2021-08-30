pkgname=uwuEdit
pkgver=master

fetch() {
	git clone https://github.com/breadtard/uwuTools
	cp -r uwuTools/uwuEdit ./
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
	cat LICENSE
}

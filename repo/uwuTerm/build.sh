pkgname=uwuterm
pkgver=main
LICENSE=LICENSE

fetch() {
	git clone https://github.com/breadtard/uwuTools --depth 1 --jobs 5
}

build() {
	cd uwuTools
	cd uwuTerm
	meson build
	cd build
	meson compile
}

package() {
	cd uwuTools
	cd uwuTerm
	install -Dm755 build/uwuterm /usr/bin/
}

license() {
        cd uwuTools
	cd uwuTerm
        cat $LICENSE
}

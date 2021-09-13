# url http://www.ivarch.com/programs/sources/pv-1.6.6.tar.bz2
# md5 ff3564fddcc2b9bd4a9c1d143aba4b4c
# bld {{'dev/lang/cctools' | darwin}} dev/build/make env/tools env/c env/bootstrap

build() {
    $untar ${src}/pv* && cd pv*

    export LD=ld

{% if mix.platform.target.os == 'darwin' %}
    export CPPFLAGS="-Dstat64=stat -Dfstat64=fstat -Dlstat64=lstat $CPPFLAGS"
{% else %}
    ln -s $(which ld.lld) ld
{% endif %}

    ln -s $(which dash) sh

    export PATH="$(pwd):$PATH"

    dash ./configure $COFLAGS --prefix="${out}"
    make -j ${make_thrs}
    make install
}

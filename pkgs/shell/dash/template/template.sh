# url http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.3.tar.gz
# md5 c7016b513f701d88c70b3082eb183581
{{self.deps().strip()}}

build() {
    $untar $src/dash-* && cd dash-*

{% if mix.platform.target.os == 'darwin' %}
    export CPPFLAGS="-Dstat64=stat $CPPFLAGS"
{% endif %}

    setup_compiler

    dash ./configure \
        $(echo $COFLAGS | tr ' ' '\n' | grep -v 'static' | grep -v 'libedit' | tr '\n' ' ') \
        --prefix=$out \
        {{self.conf().replace('\n', ' ').strip()}}

    make -j $make_thrs
    make install
}

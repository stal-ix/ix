{% extends '//util/make.sh' %}

{% block fetch %}
# url https://github.com/JuliaStrings/utf8proc/archive/v2.6.1.tar.gz
# md5 9fe61625c105f911a2c89423f071ef1d
{% endblock %}

{% block deps %}
# bld dev/build/make env/std
{% endblock %}

{% block build %}
make CC=gcc prefix=$out -j $make_thrs libutf8proc.a

>libutf8proc.so.2.4.1
>libutf8proc.dylib

make CC=gcc prefix=$out -j $make_thrs
{% endblock %}

{% block install %}
make CC=gcc prefix=$out -j $make_thrs install
{% endblock %}

{% block env %}
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lutf8proc \$LDFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
{% endblock %}

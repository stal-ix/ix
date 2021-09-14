{% extends '//util/autohell.sh' %}

{% block fetch %}
# url http://xmlsoft.org/sources/libxml2-2.9.12.tar.gz
# md5 f433a39be087a9f0b197eb2307ad9f75
{% endblock %}

{% block deps %}
# bld lib/iconv boot/final/env/tools
{% endblock %}

{% block coflags %}
--with-ftp=off
--with-http=off
--with-modules=off
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lxml2 \${LDFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\$PKG_CONFIG_PATH"
export COFLAGS="--with-libxml2-prefix=${out} \${COFLAGS}"
{% endblock %}

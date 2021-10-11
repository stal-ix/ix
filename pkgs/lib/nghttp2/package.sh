{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/nghttp2/nghttp2/releases/download/v1.43.0/nghttp2-1.43.0.tar.xz
# md5 c1d607bf3830000acd7a51f0058f4bd2
{% endblock %}

{% block deps %}
# lib lib/z lib/c-ares lib/openssl
# bld dev/build/make dev/build/pkg-config env/std
{% endblock %}

{% block coflags %}
--enable-lib-only
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lnghttp2 \${LDFLAGS}"
{% endblock %}

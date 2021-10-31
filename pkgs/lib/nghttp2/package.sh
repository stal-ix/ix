{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/nghttp2/nghttp2/releases/download/v1.43.0/nghttp2-1.43.0.tar.xz
# md5 c1d607bf3830000acd7a51f0058f4bd2
{% endblock %}

{% block deps %}
# lib lib/z/package.sh
# lib lib/c-ares/package.sh
# lib lib/openssl/package.sh
# bld dev/build/make/package.sh
# bld dev/build/pkg-config/package.sh
# bld env/std/package.sh
{% endblock %}

{% block coflags %}
--enable-lib-only
{% endblock %}

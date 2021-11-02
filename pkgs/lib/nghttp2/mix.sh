{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/nghttp2/nghttp2/releases/download/v1.43.0/nghttp2-1.43.0.tar.xz
# md5 c1d607bf3830000acd7a51f0058f4bd2
{% endblock %}

{% block lib_deps %}
lib/z/mix.sh
lib/c-ares/mix.sh
lib/openssl/mix.sh
{% endblock %}

{% block bld_deps %}
env/autohell/mix.sh
{% endblock %}

{% block coflags %}
--enable-lib-only
{% endblock %}

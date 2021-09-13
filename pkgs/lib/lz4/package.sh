{% extends '//util/make.sh' %}

{% block fetch %}
# url https://github.com/lz4/lz4/archive/refs/tags/v1.9.3.tar.gz
# md5 3a1ab1684e14fc1afc66228ce61b2db3
{% endblock %}

{% block deps %}
# bld dev/build/make env/tools env/c env/bootstrap
{% endblock %}

{% block build %}
make PREFIX=${out} BUILD_SHARED=no -j ${make_thrs} allmost
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \$CPPFLAGS"
export LDFLAGS="-L${out}/lib -llz4 \$LDFLAGS"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\$PKG_CONFIG_PATH"
{% endblock %}

{% extends '//util/cmake.sh' %}

{% block fetch %}
# url https://github.com/freedesktop/uchardet/archive/refs/tags/v0.0.7.tar.gz
# md5 f1ac05da2edfc17b12d1f942695f59b8
{% endblock %}

{% block deps %}
# bld lib/cxx env/std boot/final/env/tools
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -luchardet \${LDFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\${PKG_CONFIG_PATH}"
export CMFLAGS="-DUCHARDET_LIBRARY=${out}/lib/libuchardet.a -DUCHARDET_INCLUDE_DIR=${out}/include/uchardet \${CMFLAGS}"
{% endblock %}

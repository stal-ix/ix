{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://github.com/freedesktop/uchardet/archive/refs/tags/v0.0.7.tar.gz
# md5 f1ac05da2edfc17b12d1f942695f59b8
{% endblock %}

{% block deps %}
# bld lib/cxx/package.sh
# bld env/std/package.sh
# bld boot/final/env/tools/package.sh
{% endblock %}

{% block env %}
export CMFLAGS="-DUCHARDET_LIBRARY=${out}/lib/libuchardet.a -DUCHARDET_INCLUDE_DIR=${out}/include/uchardet \${CMFLAGS}"
{% endblock %}

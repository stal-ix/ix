{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://github.com/freedesktop/uchardet/archive/refs/tags/v0.0.7.tar.gz
# md5 f1ac05da2edfc17b12d1f942695f59b8
{% endblock %}

{% block deps %}
# bld lib/cxx/mix.sh
# bld env/std/mix.sh
# bld boot/final/env/tools/mix.sh
{% endblock %}

{% block env %}
export CMFLAGS="-DUCHARDET_LIBRARY=${out}/lib/libuchardet.a -DUCHARDET_INCLUDE_DIR=${out}/include/uchardet \${CMFLAGS}"
{% endblock %}

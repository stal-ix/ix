{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://github.com/gabime/spdlog/archive/refs/tags/v1.8.5.tar.gz
# md5 8755cdbc857794730a022722a66d431a
{% endblock %}

{% block deps %}
# lib lib/cxx
# bld dev/build/cmake env/std
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lspdlog \${LDFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\${PKG_CONFIG_PATH}"
export CMFLAGS="-DSPDLOG_INCLUDE_DIR=${out}/include \${CMFLAGS}"
{% endblock %}

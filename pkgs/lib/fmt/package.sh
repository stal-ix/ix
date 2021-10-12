{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://github.com/fmtlib/fmt/archive/refs/tags/7.1.3.tar.gz
# md5 2522ec65070c0bda0ca288677ded2831
{% endblock %}

{% block deps %}
# lib lib/cxx
# bld dev/build/cmake env/std
{% endblock %}

{% block env %}
export CMFLAGS="-Dfmt_INCLUDE_DIR=${out}/include -Dfmt_LIBRARY=${out}/lib/libfmt.a \${CMFLAGS}"
{% endblock %}

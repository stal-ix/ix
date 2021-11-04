{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/fmtlib/fmt/archive/refs/tags/7.1.3.tar.gz
2522ec65070c0bda0ca288677ded2831
{% endblock %}

{% block lib_deps %}
lib/cxx/mix.sh
{% endblock %}

{% block bld_deps %}
dev/build/cmake/mix.sh
env/std/mix.sh
{% endblock %}

{% block env %}
export CMFLAGS="-Dfmt_INCLUDE_DIR=${out}/include -Dfmt_LIBRARY=${out}/lib/libfmt.a \${CMFLAGS}"
{% endblock %}

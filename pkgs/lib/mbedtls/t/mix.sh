{% extends '//mix/template/cmake.sh' %}

{% block bld_tool %}
dev/tool/python/mix.sh
{% endblock %}

{% block cmake_flags %}
MBEDTLS_FATAL_WARNINGS=OFF
{% endblock %}

{% block patch %}
cat library/CMakeLists.txt | grep -v no_warning_for_no_symbols > _ && mv _ library/CMakeLists.txt
{% endblock %}

{% block env %}
export COFLAGS="--with-mbedtls=${out} --with-crypto-library=mbedtls \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
{% endblock %}

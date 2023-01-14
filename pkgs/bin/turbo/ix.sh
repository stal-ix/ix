{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/magiblot/turbo/archive/51ab6566b01a4edf927519c4d96eb55b302aa391.zip
sha:636ed0021334a744e1786772b6c697943400d3b5f87e7ddbc2f189b04e9758ad
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/fmt
lib/magic
lib/tvision
lib/clipboard
{% endblock %}

{% block patch %}
cat << EOF >> CMakeLists.txt
install(TARGETS turbo DESTINATION bin)
EOF
{% endblock %}

{% block cmake_flags %}
TURBO_USE_SYSTEM_DEPS=ON
TURBO_USE_SYSTEM_TVISION=ON
{% endblock %}

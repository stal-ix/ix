{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/magiblot/turbo/archive/80d2b67b9bce7eaa49a77ad05c367f5c99ae6afb.zip
sha:0ea380517f303cc5d4f4d2db9ed6c77ad48467e2af82dc46026999442c367009
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

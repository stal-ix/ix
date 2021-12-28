{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/magiblot/turbo/archive/971aad35d4b705228caa8852114438ee71d488d8.zip
53d2cdb6a47cad1796d32dc5839726e8
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

{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/WerWolv/ImHex/releases/download/v1.19.1/Full.Sources.tar.gz
sha:b6f1195986402bae72c3776fb092ebfe6adf4365939e1744b29d29e49039042e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/fmt
lib/dbus
lib/curl
lib/yara
lib/glfw
lib/mesa/gl
lib/freetype
lib/mbedtls/3
lib/cap/stone
lib/glfw/deps
lib/python/3/10
lib/json/nlohmann
{% endblock %}

{% block bld_tool %}
bld/python
bld/scripts/dlfcn
{% endblock %}

{% block patch %}
find . -type f -name CMakeLists.txt | while read l; do
    sed -e 's|find_package.*OpenGL.*||' \
        -e 's|OpenGL::GL||g' \
        -e 's| glfw | glfw3 |g' \
        -i ${l}
done

sed -e 's|.*downloadImHexPatternsFiles(.*||' -i cmake/build_helpers.cmake

find . -type f | while read l; do
    sed -e 's|std::abs(index)|(index > 0 ? index : -index)|g' \
        -e 's|boyer_moore_horspool_searcher|default_searcher|g' \
        -i "${l}"
done
{% endblock %}

{% block cmake_flags %}
IMHEX_OFFLINE_BUILD=ON
USE_SYSTEM_FMT=ON
USE_SYSTEM_CURL=ON
USE_SYSTEM_YARA=ON
USE_SYSTEM_CAPSTONE=ON
USE_SYSTEM_NLOHMANN_JSON=ON
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block build %}
{{super()}}
>${tmp}/obj/plugins/builtin.hexplug
{% endblock %}

{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/WerWolv/ImHex/releases/download/v1.19.2/Full.Sources.tar.gz
sha:0c12d0dfb692414b38a8556c312db7f72ccdfccb4b82b798566e427f0590e73e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/fmt
lib/dbus
lib/curl
lib/magic
lib/mesa/gl
lib/freetype
lib/mbedtls/3
lib/python/3/10
lib/json/nlohmann
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block patch %}
find . -type f -name CMakeLists.txt | while read l; do
    sed -e 's|find_package.*OpenGL.*||' -e 's|OpenGL::GL||g' -i ${l}
done
{% endblock %}

{% block cmake_flags %}
USE_SYSTEM_NLOHMANN_JSON=ON
USE_SYSTEM_FMT=ON
USE_SYSTEM_CURL=ON
USE_SYSTEM_LLVM=OFF
USE_SYSTEM_YARA=OFF
USE_SYSTEM_CAPSTONE=OFF
IMHEX_OFFLINE_BUILD=ON
{% endblock %}

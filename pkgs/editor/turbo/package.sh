{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://github.com/magiblot/turbo/archive/971aad35d4b705228caa8852114438ee71d488d8.zip
# md5 53d2cdb6a47cad1796d32dc5839726e8
{% endblock %}

{% block deps %}
# bld lib/cxx/package.sh
# bld lib/fmt/package.sh
# bld lib/magic/package.sh
# bld lib/tvision/package.sh
# bld lib/clipboard/package.sh
# bld dev/build/cmake/package.sh
# bld env/std/package.sh
{% endblock %}

{% block patch %}
echo 'install(TARGETS turbo DESTINATION bin)' >> CMakeLists.txt
{% endblock %}

{% block cmflags %}
-DTURBO_USE_SYSTEM_DEPS=ON
-DTURBO_USE_SYSTEM_TVISION=ON
{% endblock %}

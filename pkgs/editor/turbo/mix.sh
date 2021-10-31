{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://github.com/magiblot/turbo/archive/971aad35d4b705228caa8852114438ee71d488d8.zip
# md5 53d2cdb6a47cad1796d32dc5839726e8
{% endblock %}

{% block deps %}
# bld lib/cxx/mix.sh
# bld lib/fmt/mix.sh
# bld lib/magic/mix.sh
# bld lib/tvision/mix.sh
# bld lib/clipboard/mix.sh
# bld dev/build/cmake/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block patch %}
echo 'install(TARGETS turbo DESTINATION bin)' >> CMakeLists.txt
{% endblock %}

{% block cmflags %}
-DTURBO_USE_SYSTEM_DEPS=ON
-DTURBO_USE_SYSTEM_TVISION=ON
{% endblock %}

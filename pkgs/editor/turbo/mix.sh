{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/magiblot/turbo/archive/971aad35d4b705228caa8852114438ee71d488d8.zip
53d2cdb6a47cad1796d32dc5839726e8
{% endblock %}

{% block bld_deps %}
lib/c++/mix.sh
lib/fmt/mix.sh
lib/magic/mix.sh
lib/tvision/mix.sh
lib/clipboard/mix.sh
dev/build/cmake/mix.sh
env/std/mix.sh
{% endblock %}

{% block patch %}
echo 'install(TARGETS turbo DESTINATION bin)' >> CMakeLists.txt
{% endblock %}

{% block cmflags %}
-DTURBO_USE_SYSTEM_DEPS=ON
-DTURBO_USE_SYSTEM_TVISION=ON
{% endblock %}

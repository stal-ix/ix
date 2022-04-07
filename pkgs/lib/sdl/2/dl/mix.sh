{% extends '//mix/dlstubs.sh' %}

{% block lib_deps %}
lib/sdl/2
{% endblock %}

{% block export_libs %}
${lib_sdl_2}/lib/libSDL2.a
{% endblock %}

{% block export_lib %}
SDL2-2
{% endblock %}

{% extends '//lib/de265/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/sdl/2
lib/ffmpeg
lib/sdl/deps
{% endblock %}

{% block build_flags %}
{{super()}}
shut_up
{% endblock %}

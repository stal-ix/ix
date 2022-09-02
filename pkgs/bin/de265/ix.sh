{% extends '//lib/de265/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/sdl/1
lib/ffmpeg
lib/sdl/deps
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-sherlock265
{% endblock %}

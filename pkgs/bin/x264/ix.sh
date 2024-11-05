{% extends '//lib/x264/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/x264
lib/ffmpeg
{% endblock %}

{% block configure_all_flags %}
{{super()}}
--system-libx264
{% endblock %}

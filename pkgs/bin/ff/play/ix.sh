{% extends '//lib/ffmpeg/6/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/sdl/2
lib/sdl/deps
{% endblock %}

{% block ffmpeg_programs %}
--disable-ffmpeg
--disable-ffprobe
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
parse_number
{% endblock %}

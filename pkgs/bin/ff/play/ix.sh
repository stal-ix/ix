{% extends '//lib/ffmpeg/trunk/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/sdl/2
lib/x265/dl
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

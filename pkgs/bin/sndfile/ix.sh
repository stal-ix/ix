{% extends '//lib/sndfile/t/ix.sh' %}

{% block bld_libs %}
lib/opus
lib/lame
lib/sndio
lib/kernel
lib/mpg123
lib/xiph/ogg
lib/xiph/flac
lib/xiph/speex
lib/xiph/vorbis
{{super()}}
{% endblock %}

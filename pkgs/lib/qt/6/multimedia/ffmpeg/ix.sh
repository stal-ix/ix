{% extends '//lib/qt/6/multimedia/ix.sh' %}

{% block lib_deps %}
lib/alsa
lib/ffmpeg
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
FEATURE_alsa=ON
FEATURE_ffmpeg=ON
FEATURE_linux_v4l=OFF
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*CONDITION FFmpeg_FOUND.*||' -i src/multimedia/configure.cmake
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|llibavformat.a|lavformat|' \
    -e 's|llibavcodec.a|lavcodec|' \
    -e 's|llibswresample.a|lswresample|' \
    -e 's|llibswscale.a|lswscale|' \
    -e 's|llibavutil.a|lavutil|' \
    -i ${out}/plugins/multimedia/libffmpegmediaplugin.prl
{% endblock %}

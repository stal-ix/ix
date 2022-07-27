{% extends '//lib/ffmpeg/4/ix.sh' %}

{% block fetch %}
#https://ffmpeg.org/releases/ffmpeg-5.1.tar.xz
#sha:55eb6aab5ee235550fa54a33eaf8bf1b4ec66c01453182b12f6a993d75698b03
https://github.com/FFmpeg/FFmpeg/archive/refs/tags/n5.0.1.tar.gz
sha:c0dd80d97e6e124fbe9c170a47ab23700e37cbc08730e105f6675c6c2c4d2f27
{% endblock %}

{% extends '//mix/make.sh' %}

{% block fetch %}
https://ffmpeg.org/releases/ffmpeg-4.4.2.tar.xz
sha:af419a7f88adbc56c758ab19b4c708afbcae15ef09606b82b855291f6a6faa93
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/nasm
bld/perl
bld/pkg/config
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block configure %}
sh ./configure \
    --prefix=${out} \
    --enable-gpl \
    --enable-static \
    --disable-shared \
    --disable-programs
{% endblock %}

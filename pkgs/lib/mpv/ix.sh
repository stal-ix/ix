{% extends '//die/c/waf.sh' %}

{% block fetch %}
https://github.com/mpv-player/mpv/archive/refs/tags/v0.34.1.tar.gz
sha:32ded8c13b6398310fa27767378193dc1db6d78b006b70dbcbd3123a1445e746
{% endblock %}

{% block lib_deps %}
lib/c
lib/ass
lib/zimg
lib/ffmpeg
lib/openal
lib/archive
lib/uchardet
lib/placebo/4
{% endblock %}

{% block bld_tool %}
bin/waf
bld/perl
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block waf_flags %}
--enable-libmpv-shared
--enable-openal
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
cp libmpv.so libmpv.a
{% endblock %}

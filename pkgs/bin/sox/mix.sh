{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/sox/sox/14.4.2/sox-14.4.2.tar.bz2
sha:81a6956d4330e75b5827316e44ae381e6f1e8928003c6aa45896da9041ea149c
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/mad
lib/lame
lib/opus
lib/magic
lib/sndfile
lib/xiph/ogg
lib/xiph/vorbis
{% endblock %}

{% block patch %}
sed -e 's|.*#error.*FIX.*NEED.*||' -i src/formats.c
{% endblock %}

{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
sox
{% endblock %}

{% block version %}
14.9.0
{% endblock %}

{% block fetch %}
https://codeberg.org/sox_ng/sox_ng/archive/sox_ng-{{self.version().strip()}}.tar.gz
895e81fc7710e5bc02000bf337ef5f90171fa7ebfeb27575f3a2709e2be6329b
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
cat << EOF > test/Makefile
all:
install:
EOF
{% endblock %}

{% block bld_tool %}
bin/bash/lite/sh
bin/auto/conf/archive
{% endblock %}

{% block conf_ver %}
2/71
{% endblock  %}

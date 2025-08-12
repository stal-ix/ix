{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
sox
{% endblock %}

{% block version %}
14.6.0.4
{% endblock %}

{% block fetch %}
https://codeberg.org/sox_ng/sox_ng/archive/sox_ng-{{self.version().strip()}}.tar.gz
54be1778b4753249ef1b5360226ae7d4806658fa3b2ff79e75a4a0de69c07af7
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

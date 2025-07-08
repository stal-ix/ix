{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
sox
{% endblock %}

{% block version %}
14.6.0.2
{% endblock %}

{% block fetch %}
https://codeberg.org/sox_ng/sox_ng/archive/sox_ng-{{self.version().strip()}}.tar.gz
bec1bf44f0383d589588438fbfa7dd5a8db9161e4582f83e5bbdba80833196c3
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

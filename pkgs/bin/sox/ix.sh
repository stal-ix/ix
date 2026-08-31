{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
sox
{% endblock %}

{% block version %}
14.8.1
{% endblock %}

{% block fetch %}
https://codeberg.org/sox_ng/sox_ng/archive/sox_ng-{{self.version().strip()}}.tar.gz
25988458b873e4f5bface7ba072928dacbe35198121f4b4b38daa7575042ddfc
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

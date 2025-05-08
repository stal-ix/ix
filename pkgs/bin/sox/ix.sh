{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
sox
{% endblock %}

{% block version %}
14.5.1.2
{% endblock %}

{% block fetch %}
https://codeberg.org/sox_ng/sox_ng/archive/sox_ng-{{self.version().strip()}}.tar.gz
sha:e5fe64d0192ca38428fd6a776c58bff415810627ae81266e95f1c5f8b3af5bc0
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

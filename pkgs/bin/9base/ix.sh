{% extends '//die/c/make.sh' %}

{% block fetch %}
https://dl.suckless.org/tools/9base-6.tar.gz
sha:2997480eb5b4cf3092c0896483cd2de625158bf51c501aea2dc5cf74176d6de9
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block patch %}
sed -e 's|mygetdents(fd|getdents(fd|' -i lib9/dirread.c
{% endblock %}

{% block setup %}
export CFLAGS="-fcommon ${CFLAGS}"
{% endblock %}

{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://libbsd.freedesktop.org/releases/libbsd-0.11.8.tar.xz
sha:55fdfa2696fb4d55a592fa9ad14a9df897c7b0008ddb3b30c419914841f85f33
#broke lib/sndio
#https://libbsd.freedesktop.org/releases/libbsd-0.12.0.tar.xz
#sha:f741a3bc75162ba19f2f6666076a7961cd75dc93c234e9be4594da1e6f848cfb
{% endblock %}

{% block bld_tool %}
bld/auto
{% endblock %}

{% block setup_target_flags %}
export CPPFLAGS="-I.. -isystem ../include/bsd ${CPPFLAGS}"
{% endblock %}

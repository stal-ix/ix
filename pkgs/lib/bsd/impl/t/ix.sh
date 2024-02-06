{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://libbsd.freedesktop.org/releases/libbsd-0.11.8.tar.xz
sha:55fdfa2696fb4d55a592fa9ad14a9df897c7b0008ddb3b30c419914841f85f33
{% endblock %}

{% block bld_tool %}
bld/auto
{% endblock %}

{% block setup_target_flags %}
export CPPFLAGS="-I.. -isystem ../include/bsd ${CPPFLAGS}"
{% endblock %}

{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://libbsd.freedesktop.org/releases/libbsd-0.11.6.tar.xz
sha:19b38f3172eaf693e6e1c68714636190c7e48851e45224d720b3b5bc0499b5df
{% endblock %}

{% block bld_tool %}
bld/auto
{% endblock %}

{% block c_rename_symbol %}
reallocarray
{% endblock %}

{% block setup %}
export CPPFLAGS="-I.. -isystem ../include/bsd ${CPPFLAGS}"
{% endblock %}

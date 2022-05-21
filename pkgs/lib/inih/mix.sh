{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/benhoyt/inih/archive/r54/inih-r54.tar.gz
sha:b5566af5203f8a49fda27f1b864c0c157987678ffbd183280e16124012869869
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/bluetooth/sbc.git/snapshot/sbc-1.5.tar.gz
sha:76c04f409ec38a067c9073b007cf3f9ea3f774d54e96c30f7e0be5d94adb0fd5
{% endblock %}

{% block lib_deps %}
lib/c
lib/sndfile
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

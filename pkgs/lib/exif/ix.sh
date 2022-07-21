{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libexif/libexif/archive/refs/tags/v0.6.24.tar.gz
sha:e5f15eeab693028cfdc4c0d78f024e1ca78baa0e1f636dc443395e9fbb0a2b7a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

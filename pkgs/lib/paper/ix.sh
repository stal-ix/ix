{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/rrthomas/libpaper/releases/download/v2.1.2/libpaper-2.1.2.tar.gz
sha:1fda0cf64efa46b9684a4ccc17df4386c4cc83254805419222c064bf62ea001f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

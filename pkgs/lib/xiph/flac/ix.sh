{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/xiph/flac/archive/refs/tags/1.4.2.tar.gz
sha:8e8e0406fb9e1d177bb4ba8cfed3ca3935d37144eac8f0219a03e8c1ed5cc18e
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

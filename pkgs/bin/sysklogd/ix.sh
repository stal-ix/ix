{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
sysklogd
{% endblock %}

{% block version %}
2.7.1
{% endblock %}

{% block fetch %}
https://github.com/troglobit/sysklogd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:7ed9a40f4e79e697a41222e39afed1328cf82766116aaa40de3b3933cfee790d
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

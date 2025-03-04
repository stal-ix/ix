{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/troglobit/sysklogd/archive/refs/tags/v2.7.1.tar.gz
sha:7ed9a40f4e79e697a41222e39afed1328cf82766116aaa40de3b3933cfee790d
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

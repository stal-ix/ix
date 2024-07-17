{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/troglobit/sysklogd/archive/refs/tags/v2.6.0.tar.gz
sha:198507d9c659284e4e022fc000069444bd0048562579ed3915ce2c039d8b0bdc
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

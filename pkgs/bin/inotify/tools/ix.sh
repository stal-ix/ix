{% extends '//die/c/autorehell.sh' %}

{% block version %}
3.20.11.0
{% endblock %}

{% block fetch %}
https://github.com/inotify-tools/inotify-tools/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:58a3cde89e4a5111a87ac16b56b06a8f885460fca0aea51b69c856ce30a37a14
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

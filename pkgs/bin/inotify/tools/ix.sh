{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
inotify-tools
{% endblock %}

{% block version %}
4.23.9.0
{% endblock %}

{% block fetch %}
https://github.com/inotify-tools/inotify-tools/archive/refs/tags/{{self.version().strip()}}.tar.gz
1dfa33f80b6797ce2f6c01f454fd486d30be4dca1b0c5c2ea9ba3c30a5c39855
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build_flags %}
no_werror
{% endblock %}

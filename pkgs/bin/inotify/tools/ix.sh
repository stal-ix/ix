{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
inotify-tools
{% endblock %}

{% block version %}
4.25.9.0
{% endblock %}

{% block fetch %}
https://github.com/inotify-tools/inotify-tools/archive/refs/tags/{{self.version().strip()}}.tar.gz
d33a4fd24c72c2d08893f129d724adf725b93dae96c359e4f4e9f32573cc853b
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build_flags %}
no_werror
{% endblock %}

{% extends '//bin/meson/1/6/ix.sh' %}

{% block pkg_name %}
meson
{% endblock %}

{% block version %}
1.9.2
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/{{self.version().strip()}}.tar.gz
5fb4bac43cc05454121238e5b3698990592d3bf9bc738ce4a90255afcc7b39fe
{% endblock %}

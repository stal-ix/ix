{% extends '//bin/meson/1/6/ix.sh' %}

{% block pkg_name %}
meson
{% endblock %}

{% block version %}
1.8.1
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:c945684cfa718e24d98e880a384d5263d3ce8338501639c388451c85b8deebab
{% endblock %}

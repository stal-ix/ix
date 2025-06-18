{% extends '//bin/meson/1/6/ix.sh' %}

{% block pkg_name %}
meson
{% endblock %}

{% block version %}
1.8.2
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/{{self.version().strip()}}.tar.gz
6b878fb0f6f0318cbd54e13539f89a1a8305791668e8e93ffd59d82722888dac
{% endblock %}

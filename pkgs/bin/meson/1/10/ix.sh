{% extends '//bin/meson/1/6/ix.sh' %}

{% block pkg_name %}
meson
{% endblock %}

{% block version %}
1.10.2
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/{{self.version().strip()}}.tar.gz
4f3c6fe1d163fb6d5b52094035fc29d14cf4a254c3ac29544ba0a3d5a739c7ba
{% endblock %}

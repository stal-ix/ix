{% extends '//bin/meson/1/3/ix.sh' %}

{% block pkg_name %}
meson
{% endblock %}

{% block version %}
1.2.3
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/{{self.version().strip()}}.tar.gz
1340bbc017eead2ddf706fb36a6dcc46796deec6b1513005de67e862c1b737cf
{% endblock %}

{% extends '//bin/meson/1/6/ix.sh' %}

{% block pkg_name %}
meson
{% endblock %}

{% block version %}
1.12.1
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/{{self.version().strip()}}.tar.gz
64731a3a08ae94837e480f866cb1a2be9b12b9010899317f1db097ce5281a52a
{% endblock %}

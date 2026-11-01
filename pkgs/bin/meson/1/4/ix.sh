{% extends '//bin/meson/1/3/ix.sh' %}

{% block pkg_name %}
meson
{% endblock %}

{% block version %}
1.4.2
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/{{self.version().strip()}}.tar.gz
11d1336fe35e1ade57510a846a31d7dc2e3b6ac1e2491c2831bce5a2a192ba0d
{% endblock %}

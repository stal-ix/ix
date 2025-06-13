{% extends '//bin/meson/1/3/ix.sh' %}

{% block pkg_name %}
meson
{% endblock %}

{% block version %}
1.4.1
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/{{self.version().strip()}}.tar.gz
a7efc72ecb873c5a62031ade1921a7177b67cfdcb2e9410a7ab023f9e8192f4b
{% endblock %}

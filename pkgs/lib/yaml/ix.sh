{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libyaml
{% endblock %}

{% block version %}
0.2.5
{% endblock %}

{% block fetch %}
https://github.com/yaml/libyaml/archive/refs/tags/{{self.version().strip()}}.tar.gz
fa240dbf262be053f3898006d502d514936c818e422afdcf33921c63bed9bf2e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

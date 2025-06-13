{% extends '//bin/meson/1/3/ix.sh' %}

{% block pkg_name %}
meson
{% endblock %}

{% block version %}
1.6.1
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/{{self.version().strip()}}.tar.gz
4889795777b536ea1a351982f3ef7c7b06a786ccb47036daba63cc5757c59edb
{% endblock %}

{% block step_patch %}
echo 'no patch'
{% endblock %}

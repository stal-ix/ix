{% extends '//bin/meson/1/6/ix.sh' %}

{% block pkg_name %}
meson
{% endblock %}

{% block version %}
1.8.0
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:eea5274173e00b4b8144b754df5c6e9ccf9ea5acd4e9768efe5d591db2aa3f45
{% endblock %}

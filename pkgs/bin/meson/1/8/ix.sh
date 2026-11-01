{% extends '//bin/meson/1/6/ix.sh' %}

{% block pkg_name %}
meson
{% endblock %}

{% block version %}
1.8.5
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/{{self.version().strip()}}.tar.gz
1cd0b5b013b4208ab450f5aca93b592b707f3fb2afe96b101dc710e6e5a8245c
{% endblock %}

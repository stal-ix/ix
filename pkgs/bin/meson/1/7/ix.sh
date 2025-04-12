{% extends '//bin/meson/1/6/ix.sh' %}

{% block version %}
1.7.2
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:3640ef596523393100df31ba790bc5fe732215e9711a66b673a21c4eb39bc8f1
{% endblock %}

{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
BLAKE3
{% endblock %}

{% block version %}
1.8.2
{% endblock %}

{% block fetch %}
https://github.com/BLAKE3-team/BLAKE3/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:6b51aefe515969785da02e87befafc7fdc7a065cd3458cf1141f29267749e81f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd c
{% endblock %}

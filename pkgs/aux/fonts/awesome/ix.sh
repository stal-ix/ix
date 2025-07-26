{% extends '//die/fonts.sh' %}

{% block pkg_name %}
Font-Awesome
{% endblock %}

{% block version %}
7.0.0
{% endblock %}

{% block fetch %}
https://github.com/FortAwesome/Font-Awesome/archive/refs/tags/{{self.version().strip()}}.tar.gz
ac6013cd8c7c49f3f388506bf2ef4c280edea38cc0267d83b445cf1f8a3c1e4b
{% endblock %}

{% block unpack %}
{{super()}}
cd otfs
{% endblock %}

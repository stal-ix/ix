{% extends '//die/fonts.sh' %}

{% block pkg_name %}
Font-Awesome
{% endblock %}

{% block version %}
7.0.1
{% endblock %}

{% block fetch %}
https://github.com/FortAwesome/Font-Awesome/archive/refs/tags/{{self.version().strip()}}.tar.gz
7d22a5a190730b4f4ae2fc0a7b2ef43c3e40c14ca9f7217704752563dcd9a356
{% endblock %}

{% block unpack %}
{{super()}}
cd otfs
{% endblock %}

{% extends '//die/fonts.sh' %}

{% block pkg_name %}
Font-Awesome
{% endblock %}

{% block version %}
6.7.2
{% endblock %}

{% block fetch %}
https://github.com/FortAwesome/Font-Awesome/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:fdebdf3f1b8641a4b665c61f1f48e482b140a817ce619113559201b8a1fcdd51
{% endblock %}

{% block unpack %}
{{super()}}
cd otfs
{% endblock %}

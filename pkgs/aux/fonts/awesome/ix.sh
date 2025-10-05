{% extends '//die/fonts.sh' %}

{% block pkg_name %}
Font-Awesome
{% endblock %}

{% block version %}
7.1.0
{% endblock %}

{% block fetch %}
https://github.com/FortAwesome/Font-Awesome/archive/refs/tags/{{self.version().strip()}}.tar.gz
5b54f06149974ca7d160e76129e3473c64349c3653c95a1490817c6603f12295
{% endblock %}

{% block unpack %}
{{super()}}
cd otfs
{% endblock %}

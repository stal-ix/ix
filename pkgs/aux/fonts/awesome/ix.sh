{% extends '//die/fonts.sh' %}

{% block pkg_name %}
Font-Awesome
{% endblock %}

{% block version %}
7.3.1
{% endblock %}

{% block fetch %}
https://github.com/FortAwesome/Font-Awesome/archive/refs/tags/{{self.version().strip()}}.tar.gz
d5a20554faa1ad30148b05f090a556e23495c446435c8dfc1624d3c0e3c2640b
{% endblock %}

{% block unpack %}
{{super()}}
cd otfs
{% endblock %}

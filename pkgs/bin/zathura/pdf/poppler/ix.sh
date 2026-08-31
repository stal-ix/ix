{% extends '//bin/zathura/t/ix.sh' %}

{% block pkg_name %}
zathura-pdf-poppler
{% endblock %}

{% block version %}
2026.07.18
{% endblock %}

{% block fetch %}
https://github.com/pwmt/zathura-pdf-poppler/archive/refs/tags/{{self.version().strip()}}.tar.gz
93003f41d8d2dc4c3c5d5ee076012563d1836ab0043debe741945881fb62d2ca
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/poppler
{% endblock %}

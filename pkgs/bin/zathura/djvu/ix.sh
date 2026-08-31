{% extends '//bin/zathura/t/ix.sh' %}

{% block pkg_name %}
zathura-djvu
{% endblock %}

{% block version %}
2026.07.18
{% endblock %}

{% block fetch %}
https://github.com/pwmt/zathura-djvu/archive/refs/tags/{{self.version().strip()}}.tar.gz
f28d5cdeba17f84c6b60d37a642fff1889033207c5757d79ef7e00d519122329
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/djvulibre
{% endblock %}

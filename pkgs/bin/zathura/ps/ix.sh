{% extends '//bin/zathura/t/ix.sh' %}

{% block pkg_name %}
zathura-ps
{% endblock %}

{% block version %}
2026.07.18
{% endblock %}

{% block fetch %}
https://github.com/pwmt/zathura-ps/archive/refs/tags/{{self.version().strip()}}.tar.gz
a1dda58b46dc15677c6861430e72900ec160ad8655e0059c9942d235b3b22b60
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/spectre
{% endblock %}

{% extends '//bin/zathura/t/ix.sh' %}

{% block pkg_name %}
zathura-ps
{% endblock %}

{% block version %}
0.2.8
{% endblock %}

{% block fetch %}
https://github.com/pwmt/zathura-ps/archive/refs/tags/{{self.version().strip()}}.tar.gz
b8b42c4517e4bdaee4c84c1c6e7298cabf00fc40b9b95f59feee0f61fe780b54
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/spectre
{% endblock %}

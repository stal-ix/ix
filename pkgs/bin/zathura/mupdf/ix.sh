{% extends '//bin/zathura/t/ix.sh' %}

{% block pkg_name %}
zathura-pdf-mupdf
{% endblock %}

{% block version %}
0.4.4
{% endblock %}

{% block fetch %}
https://github.com/pwmt/zathura-pdf-mupdf/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:90bdc7c0d4b5f6bd7b17f9c3832ae5eb8465b45d78ab3b8c2fca26ed45ed1177
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/mu/pdf
{% endblock %}

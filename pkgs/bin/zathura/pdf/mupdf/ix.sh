{% extends '//bin/zathura/t/ix.sh' %}

{% block pkg_name %}
zathura-pdf-mupdf
{% endblock %}

{% block version %}
2026.07.18
{% endblock %}

{% block fetch %}
https://github.com/pwmt/zathura-pdf-mupdf/archive/refs/tags/{{self.version().strip()}}.tar.gz
90a120edcc2533167597d26b24b5e4b6b5208379dd2ff74ce94ce2df514a0371
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/mu/pdf
{% endblock %}

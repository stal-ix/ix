{% extends '//bin/zathura/t/ix.sh' %}

{% block fetch %}
https://github.com/pwmt/zathura-pdf-mupdf/archive/refs/tags/0.4.0.tar.gz
sha:60663e9aad4b639f86fc4e54614361a653a48dcf257499a98cb050ed19a70af8
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/mu/pdf
{% endblock %}

{% block plugin %}
mupdf
{% endblock %}

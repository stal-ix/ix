{% extends '//bin/zathura/t/ix.sh' %}

{% block fetch %}
https://pwmt.org/projects/zathura-pdf-poppler/download/zathura-pdf-poppler-0.3.1.tar.xz
sha:ee8127532cc6f92bf32d48a6a0d4c61e33cd4df49a3159e57592877ba19e108b
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/poppler
{% endblock %}

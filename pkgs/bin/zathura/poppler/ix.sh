{% extends '//bin/zathura/t/ix.sh' %}

{% block version %}
0.3.3
{% endblock %}

{% block fetch %}
https://pwmt.org/projects/zathura-pdf-poppler/download/zathura-pdf-poppler-{{self.version().strip()}}.tar.xz
sha:c812f2f4446fd5de16734e13c02ea9aa25ba4e3ba9f72b732c0ff90f9ba34935
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/poppler
{% endblock %}

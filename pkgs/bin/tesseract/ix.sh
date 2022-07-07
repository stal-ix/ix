{% extends '//lib/tesseract/t/ix.sh' %}

{% block bld_libs %}
lib/cairo
lib/pango
{{super()}}
{% endblock %}

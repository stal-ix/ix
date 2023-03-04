{% extends '//lib/lcms/2/t/ix.sh' %}

{% block bld_libs %}
lib/z
lib/jpeg
lib/tiff
{{super()}}
{% endblock %}

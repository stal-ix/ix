{% extends '//lib/jpeg/open/t/ix.sh' %}

{% block bld_libs %}
lib/z
lib/png
lib/tiff
lib/lcms/2
{{super()}}
{% endblock %}

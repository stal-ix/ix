{% extends '//lib/jpeg/open/ix.sh' %}

{% block bld_libs %}
lib/z
lib/png
lib/tiff
lib/lcms2
{{super()}}
{% endblock %}

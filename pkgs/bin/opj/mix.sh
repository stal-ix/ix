{% extends '//lib/jpeg/open/mix.sh' %}

{% block bld_libs %}
lib/z
lib/png
lib/tiff
lib/lcms2
{{super()}}
{% endblock %}

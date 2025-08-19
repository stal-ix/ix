{% extends '//lib/fontconfig/t/t/ix.sh' %}

{% block bld_libs %}
lib/intl
lib/freetype
{{super()}}
{% endblock %}

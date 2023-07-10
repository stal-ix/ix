{% extends '//lib/fontconfig/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/freetype/bootstrap
{% endblock %}

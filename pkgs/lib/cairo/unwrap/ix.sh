{% extends '//lib/cairo/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/freetype/bootstrap
lib/fontconfig/bootstrap
{% endblock %}

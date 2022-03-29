{% extends '//lib/freetype/nohb/mix.sh' %}

{% block bld_libs %}
lib/harfbuzz/ft
lib/freetype/nohb
{{super()}}
{% endblock %}

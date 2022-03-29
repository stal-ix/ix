{% extends '//lib/freetype/nohb/mix.sh' %}

{% block bld_libs %}
lib/harfbuzz/ft
lib/freetype/nohb
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-harfbuzz=yes
{% endblock %}

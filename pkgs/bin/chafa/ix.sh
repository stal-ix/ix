{% extends '//lib/chafa/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/rsvg
lib/freetype
lib/image/magick
{% endblock %}

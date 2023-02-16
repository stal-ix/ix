{% extends '//lib/heif/t/ix.sh' %}

{% block bld_libs %}
lib/z
lib/png
lib/jpeg
lib/gdk/pixbuf
{{super()}}
{% endblock %}

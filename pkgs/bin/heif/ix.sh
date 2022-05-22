{% extends '//lib/heif/ix.sh' %}

{% block bld_libs %}
lib/png
lib/jpeg
lib/gdk/pixbuf
{{super()}}
{% endblock %}

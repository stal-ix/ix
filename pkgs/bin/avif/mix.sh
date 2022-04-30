{% extends '//lib/avif/t/mix.sh' %}

{% block bld_libs %}
lib/gdk/pixbuf
{{super()}}
{% endblock %}

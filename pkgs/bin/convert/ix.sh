{% extends '//lib/image/magick/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/pango
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-utilities
{% endblock %}

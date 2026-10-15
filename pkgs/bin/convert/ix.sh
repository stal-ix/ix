{% extends '//lib/image/magick/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
{% if not wasi %}
lib/pango
{% endif %}
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-utilities
{% endblock %}

{% block ld_flags %}
{% if wasi %}
-Wl,-z,stack-size=8388608
{% endif %}
{% endblock %}

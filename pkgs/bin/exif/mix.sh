{% extends '//lib/exif/mix.sh' %}

{% block bld_libs %}
lib/intl
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-ship-binaries
{% endblock %}

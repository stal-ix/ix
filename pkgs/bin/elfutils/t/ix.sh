{% extends '//lib/elfutils/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--enable-deterministic-archives
{% endblock %}

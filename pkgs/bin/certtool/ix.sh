{% extends '//lib/gnutls/t/ix.sh' %}

{% block patch %}
{{super()}}
sed -e 's|error.*;||' -i src/gl/xalloc-die.c
{% endblock %}

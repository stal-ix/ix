{% extends '//bin/coreutils/lite/ix.sh' %}

{% block configure %}
export CFLAGS="-Wno-implicit-function-declaration ${CFLAGS}"
{{super()}}
exit 1
{% endblock %}

{% extends '//lib/intl/stub/ix.sh' %}

{% block env_lib %}
export COFLAGS="--disable-nls \${COFLAGS}"
{% endblock %}

{% extends '//lib/intl/stub/mix.sh' %}

{% block env_lib %}
export COFLAGS="--disable-nls \${COFLAGS}"
{% endblock %}

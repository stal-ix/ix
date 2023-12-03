{% extends '//lib/idn/2/t/ix.sh' %}

{% block env %}
export COFLAGS="--with-libidn2=${out} \${COFLAGS}"
{% endblock %}

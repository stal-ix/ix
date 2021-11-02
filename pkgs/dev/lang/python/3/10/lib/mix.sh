{% extends '//mix/template/proxy.sh' %}

{% block lib_deps %}
dev/lang/python/3/10/mix.sh
{% endblock %}

{% block bld_deps %}
env/std/mix.sh
{% endblock %}

{% block run_deps %}
dev/lang/python/libs/mix.sh
{% endblock %}

{% block env %}
export LDFLAGS="-L$(python3 -c 'import sys; print(sys.prefix)')/lib -lpython3.10 \${LDFLAGS}"
{% endblock %}

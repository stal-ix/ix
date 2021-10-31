{% extends '//mix/template/proxy.sh' %}

{% block deps %}
# lib dev/lang/python/3/10/package.sh
# run dev/lang/python/libs/package.sh
# bld env/std/package.sh
{% endblock %}

{% block env %}
export LDFLAGS="-L$(python3 -c 'import sys; print(sys.prefix)')/lib -lpython3.10 \${LDFLAGS}"
{% endblock %}

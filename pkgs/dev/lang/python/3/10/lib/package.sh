{% extends '//util/base.sh' %}

{% block deps %}
# lib dev/lang/python/3/10
# run dev/lang/python/libs
# bld env/std
{% endblock %}

{% block env %}
export LDFLAGS="-L$(python3 -c 'import sys; print(sys.prefix)')/lib -lpython3.10 \${LDFLAGS}"
{% endblock %}

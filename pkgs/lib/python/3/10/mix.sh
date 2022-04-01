{% extends '//lib/python/3/9/mix.sh' %}

{% block fetch %}
https://www.python.org/ftp/python/3.10.4/Python-3.10.4.tar.xz
sha:80bf925f571da436b35210886cf79f6eb5fa5d6c571316b73568343451f77a19
{% endblock %}

{% block setup %}
export COFLAGS=$(echo "${COFLAGS}" | tr ' ' '\n' | grep -v 'with-readline' | tr '\n' ' ')

{% if (edit or 'edit') == 'readline' %}
export COFLAGS="--with-readline=yes ${COFLAGS}"
{% else %}
export COFLAGS="--with-readline=edit ${COFLAGS}"
{% endif %}
{% endblock %}

{% block patch_sqlite_modname %}
# fixed in 3.10
{% endblock %}

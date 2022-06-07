{% extends '//lib/python/3/9/ix.sh' %}

{% block fetch %}
https://www.python.org/ftp/python/3.10.5/Python-3.10.5.tar.xz
sha:8437efd5b106ef0a75aabfbf23d880625120a73a86a22ade4d2e2e68d7b74486
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

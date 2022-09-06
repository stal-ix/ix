{% extends '//lib/python/3/9/ix.sh' %}

{% block fetch %}
https://www.python.org/ftp/python/3.10.7/Python-3.10.7.tar.xz
sha:6eed8415b7516fb2f260906db5d48dd4c06acc0cb24a7d6cc15296a604dcdc48
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

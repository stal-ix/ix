{% extends '//lib/python/3/9/ix.sh' %}

{% block fetch %}
https://www.python.org/ftp/python/3.10.8/Python-3.10.8.tar.xz
sha:6a30ecde59c47048013eb5a658c9b5dec277203d2793667f578df7671f7f03f3
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

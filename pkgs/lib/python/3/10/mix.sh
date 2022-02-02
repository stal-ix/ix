{% extends '//lib/python/3/9/mix.sh' %}

{% block fetch %}
https://www.python.org/ftp/python/3.10.2/Python-3.10.2.tar.xz
sha:17de3ac7da9f2519aa9d64378c603a73a0e9ad58dffa8812e45160c086de64c7
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

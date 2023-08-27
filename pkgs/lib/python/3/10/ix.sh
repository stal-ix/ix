{% extends '//lib/python/3/8/ix.sh' %}

{% block fetch %}
https://www.python.org/ftp/python/3.10.13/Python-3.10.13.tar.xz
sha:5c88848668640d3e152b35b4536ef1c23b2ca4bd2c957ef1ecbb053f571dd3f6
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

{% block patch %}
{{super()}}
sed -e 's|(VFunction \*)||' -i Modules/readline.c
{% endblock %}

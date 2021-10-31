{% extends '//dev/lang/python/3/template/mix.sh' %}

{% block fetch %}
# url https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tar.xz
# md5 3e7035d272680f80e3ce4e8eb492d580
{% endblock %}

{% block cflags %}
{% block fix_readline %}
export COFLAGS=$(echo "${COFLAGS}" | tr ' ' '\n' | grep -v 'with-readline' | tr '\n' ' ')

{% if mix.flags.get('edit', 'edit') == 'readline' %}
export COFLAGS="--with-readline=yes ${COFLAGS}"
{% else %}
export COFLAGS="--with-readline=edit ${COFLAGS}"
{% endif %}
{% endblock %}
{% endblock %}

{% extends '//dev/lang/python/3/template/package.sh' %}

{% block fetch %}
# url https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tar.xz
# md5 3e7035d272680f80e3ce4e8eb492d580
{% endblock %}

{% block cflags %}
export COFLAGS=$(echo "${COFLAGS}" | tr ' ' '\n' | grep -v 'with-readline' | tr '\n' ' ')
{% endblock %}

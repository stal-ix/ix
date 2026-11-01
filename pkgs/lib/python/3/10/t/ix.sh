{% extends '//lib/python/3/8/ix.sh' %}

{% block pkg_name %}
python
{% endblock %}

{% block version %}
3.10.22
{% endblock %}

{% block fetch %}
https://www.python.org/ftp/python/{{self.version().strip()}}/Python-{{self.version().strip()}}.tar.xz
c61fe9b1a1a7ec2a0b0388e664187c378a5325a89e3606d220abf5bdfccb2543
{% endblock %}

{% block setup_target_flags %}
{{super()}}
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

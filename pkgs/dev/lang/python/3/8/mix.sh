{% extends '//dev/lang/python/3/template/mix.sh' %}

{% block fetch %}
https://www.python.org/ftp/python/3.8.5/Python-3.8.5.tgz
e2f52bcf531c8cc94732c0b6ff933ff0
{% endblock %}

{% block patch %}
{{super()}}

{% block patch_sqlite_modname %}
for path in Modules/_sqlite/*; do
    sed -e 's|MODULE_NAME|"sqlite3"|' -i ${path}
done
{% endblock %}
{% endblock %}

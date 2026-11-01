{% extends '//lib/python/3/template/ix.sh' %}

{% block pkg_name %}
python
{% endblock %}

{% block version %}
3.8.20
{% endblock %}

{% block fetch %}
https://www.python.org/ftp/python/{{self.version().strip()}}/Python-{{self.version().strip()}}.tgz
9f2d5962c2583e67ef75924cd56d0c1af78bf45ec57035cf8a2cc09f74f4bf78
{% endblock %}

{% block patch %}
{{super()}}

{% block patch_sqlite_modname %}
for path in Modules/_sqlite/*; do
    sed -e 's|MODULE_NAME|"sqlite3"|' -i ${path}
done
{% endblock %}
{% endblock %}

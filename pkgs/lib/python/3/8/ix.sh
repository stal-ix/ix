{% extends '//lib/python/3/template/ix.sh' %}

{% block fetch %}
https://www.python.org/ftp/python/3.8.17/Python-3.8.17.tgz
sha:def428fa6cf61b66bcde72e3d9f7d07d33b2e4226f04f9d6fce8384c055113ae
{% endblock %}

{% block patch %}
{{super()}}

{% block patch_sqlite_modname %}
for path in Modules/_sqlite/*; do
    sed -e 's|MODULE_NAME|"sqlite3"|' -i ${path}
done
{% endblock %}
{% endblock %}

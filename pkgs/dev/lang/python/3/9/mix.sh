{% extends '//dev/lang/python/3/template/mix.sh' %}

{% block fetch %}
https://www.python.org/ftp/python/3.9.7/Python-3.9.7.tar.xz
fddb060b483bc01850a3f412eea1d954
{% endblock %}

{% block patch_sqlite_defines %}
# more hand job

for path in Modules/_sqlite/*; do
    sed -e 's|MODULE_NAME|"sqlite3"|' -i ${path}
done
{% endblock %}

{% block cflags %}
export COFLAGS=$(echo "${COFLAGS}" | tr ' ' '\n' | grep -v 'with-system-ffi' | tr '\n' ' ')
{% endblock %}

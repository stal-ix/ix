{% extends '//dev/lang/python/3/template/mix.sh' %}

{% block fetch %}
https://www.python.org/ftp/python/3.9.8/Python-3.9.8.tar.xz
d4875c1832c8f757280794f6d5e9c95f
{% endblock %}

{% block patch %}
{{super()}}

for path in Modules/_sqlite/*; do
    sed -e 's|MODULE_NAME|"sqlite3"|' -i ${path}
done
{% endblock %}

{% block setup %}
export COFLAGS=$(echo "${COFLAGS}" | tr ' ' '\n' | grep -v 'with-system-ffi' | tr '\n' ' ')
{% endblock %}

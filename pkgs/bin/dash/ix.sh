{% extends 't/ix.sh' %}

{% block host_libs %}
{{super()}}
lib/c
{% endblock %}

{% block invoke_configure %}
sh configure --prefix="${out}" \
    --with-libedit=yes \
    --build={{host.gnu.three}} \
    --host={{target.gnu.three}}
{% endblock %}

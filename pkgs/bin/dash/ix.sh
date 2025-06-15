{% extends 'lite/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/edit
{% endblock %}

{% block invoke_configure %}
sh configure --prefix="${out}" \
    --with-libedit=yes \
    --build={{host.gnu.three}} \
    --host={{target.gnu.three}}
{% endblock %}

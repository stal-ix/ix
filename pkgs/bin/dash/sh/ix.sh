{% extends '//bin/dash/ix.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block invoke_configure %}
sh configure --prefix="${out}"
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin; mv dash sh
{% endblock %}

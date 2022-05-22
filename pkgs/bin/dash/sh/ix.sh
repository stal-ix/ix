{% extends '//bin/dash/ix.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin; mv dash sh
{% endblock %}

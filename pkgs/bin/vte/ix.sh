{% extends '//lib/vte/ix.sh' %}

{% block bld_libs %}
lib/gtk/deps
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
mv vte-* vte
{% endblock %}

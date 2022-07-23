{% extends '//bin/iwd/ix.sh' %}

{% block bld_tool %}
bld/pack
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
rm -r ${out}/etc
rm ${out}/bin/iwmon
packexe ${out}/bin/iwctl
{% endblock %}

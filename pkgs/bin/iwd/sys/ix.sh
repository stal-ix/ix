{% extends '//bin/iwd/ix.sh' %}

{% block bld_tool %}
bin/upx
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
rm -r ${out}/etc
rm ${out}/bin/iwmon
upx ${out}/bin/iwctl
{% endblock %}

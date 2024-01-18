{% extends '//bin/wl/maker/t/ix.sh' %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/apps/wlmclock ${out}/bin/
{% endblock %}

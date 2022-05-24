{% extends '//bin/seatd/ix.sh' %}

{% block patch %}
sed -e 's|0770|0777|' -i seatd/seatd.c
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/bin/seatd-launch
{% endblock %}

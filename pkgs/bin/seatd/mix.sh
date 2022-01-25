{% extends '//lib/seat/mix.sh' %}

{% block patch %}
sed -e 's|0770|0777|' -i seatd/seatd.c
{% endblock %}

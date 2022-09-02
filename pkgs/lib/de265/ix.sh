{% extends 't/ix.sh' %}

{% block patch %}
{{super()}}
sed -e 's|-lstdc++||g' -i libde265.pc.in
{% endblock %}

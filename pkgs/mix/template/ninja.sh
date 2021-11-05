{% extends 'template.sh' %}

{% block build %}
cd _build && ninja -j ${make_thrs}
{% endblock %}

{% block install %}
cd _build && ninja install
{% endblock %}

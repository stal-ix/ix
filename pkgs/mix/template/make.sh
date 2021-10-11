{% extends 'template.sh' %}

{% block build %}
make PREFIX="${out}" prefix="${out}" -j ${make_thrs} || make PREFIX="${out}" prefix="${out}"
{% endblock %}

{% block install %}
make PREFIX="${out}" prefix="${out}" install
{% endblock %}

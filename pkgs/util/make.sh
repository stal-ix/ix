{% extends 'template.sh' %}

{% block build %}
make PREFIX="${out}" prefix="${out}" ${MAKE_FLAGS} -j ${make_thrs} || make PREFIX="${out}" prefix="${out}" ${MAKE_FLAGS}
{% endblock %}

{% block install %}
make PREFIX="${out}" prefix="${out}" install
{% endblock %}

{% extends '//util/template.sh' %}

{% block build %}
make $MAKE_FLAGS -j $make_thrs || make $MAKE_FLAGS
{% endblock %}

{% block install %}
make install
{% endblock %}

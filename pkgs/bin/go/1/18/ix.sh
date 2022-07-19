{% extends '//bin/go/1/16/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.18.4.tar.gz
sha:283442519c28f5c24dd8c849ebe0570a3ad92cd94610378b33b2053f60391fdf
{% endblock %}

{% block go_boot %}
bin/go/1/16
{% endblock %}

{% block build %}
export GOCACHE=${tmp}
{{super()}}
{% endblock %}

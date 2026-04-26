{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/11.tar.gz
{% endblock %}

{% block go_sha %}
c2b84e2c9d2104028c2e53948a76d68698c27d52f0eb08773fc3910cdfca58e8
{% endblock %}

{% block go_bins %}
molot
{% endblock %}

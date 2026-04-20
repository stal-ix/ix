{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/3.tar.gz
{% endblock %}

{% block go_sha %}
af871a2963ec4eb5719822ee6ebc3926829579bc0201b0ea963ed03e82344089
{% endblock %}

{% block go_bins %}
molot
{% endblock %}

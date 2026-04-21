{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/9.tar.gz
{% endblock %}

{% block go_sha %}
2e24f8fe17413c13c0f9755ae80422750ef4e0399108bf22cda9039c2949e3bb
{% endblock %}

{% block go_bins %}
molot
{% endblock %}

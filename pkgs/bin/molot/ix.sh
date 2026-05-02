{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/16.tar.gz
{% endblock %}

{% block go_sha %}
505945dd1716586565db98e92ab6d6d6c275b725c6d89ed2228543f59a9893fc
{% endblock %}

{% block go_bins %}
molot
{% endblock %}

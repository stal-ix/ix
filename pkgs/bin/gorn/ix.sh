{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/5.tar.gz
{% endblock %}

{% block go_sha %}
764288e902759036dfaa9b9cdf679eaee71b7a9622bd5505f7b3faa4906057ef
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}

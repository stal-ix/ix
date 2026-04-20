{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/11.tar.gz
{% endblock %}

{% block go_sha %}
ff6596b45843cd788c4ecd0a2002d1dd940777b137f30d1ce1f64b1c50f12575
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}

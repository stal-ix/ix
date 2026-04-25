{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/ogorod/archive/9febdb23233090b86dae4e300b1fed640fa3015b.tar.gz
{% endblock %}

{% block go_sha %}
9fb89a1d5bed2434ea9ec9959b69bff09520706acbe024c2112a3a18b27e8df7
{% endblock %}

{% block go_bins %}
ogorod
{% endblock %}

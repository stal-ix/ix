{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/5d6e57755cb2fd5bdb15d4341be23ea97e17cea8.tar.gz
{% endblock %}

{% block go_sha %}
8b3534d461ee2193340ebc9960807ae0fec69a6148a45ee9e3eee9f321d945b0
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}

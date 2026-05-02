{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/18.tar.gz
{% endblock %}

{% block go_sha %}
565f9709a2de69c94b1ca7bf00cf4e11c328922ee899de6cca2e3b06fa48b697
{% endblock %}

{% block go_bins %}
molot
{% endblock %}

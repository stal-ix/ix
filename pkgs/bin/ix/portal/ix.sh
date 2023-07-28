{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/pg83/portal/archive/refs/tags/1.tar.gz
{% endblock %}

{% block go_sha %}
bd1714c6c7b02987b849d65ea60456e2beacf5c1e8832b1f2ea44842c741e264
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp portal ${out}/bin/
{% endblock %}

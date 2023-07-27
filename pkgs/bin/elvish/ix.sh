{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/elves/elvish/archive/refs/tags/v0.19.2.tar.gz
{% endblock %}

{% block go_sha %}
a25596a25340c793bd200ee0b5a729a64238acd2f5238539503ce842945ee15a
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/elvish
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp elvish ${out}/bin/
{% endblock %}

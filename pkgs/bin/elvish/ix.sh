{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/elves/elvish/archive/refs/tags/v0.20.1.tar.gz
{% endblock %}

{% block go_sha %}
a1da4d127c40f8a5bc82420fe7ee9b5ea046d47c498b71785bca068e76b65282
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/elvish
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp elvish ${out}/bin/
{% endblock %}

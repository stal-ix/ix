{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/elves/elvish/archive/refs/tags/v0.19.1.tar.gz
{% endblock %}

{% block go_sum %}
sha:4ae99be96a717156b40fa79a0571f320c9b25ecc2daf41c0f79c63dcde709d1d
{% endblock %}

{% block go_sha %}
sha:e87f4dc999e0d1c47cb2d6c4a5f1b37d3c209c49b61aeb55bfaf65b45514a4af
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/elvish
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp elvish ${out}/bin/
{% endblock %}

{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/elves/elvish/archive/refs/tags/v0.18.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:f4635db90af2241bfd37e17ac1a72567b92d18a396598da2099a908b3d88c590
{% endblock %}

{% block go_sha %}
sha:50955a5aede68949f2c69c06086f64139ad34ca4250ed29c4c4841f5460ca577
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/elvish
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp elvish ${out}/bin/
{% endblock %}

{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/elves/elvish/archive/refs/tags/v0.18.0.tar.gz
sha:f4635db90af2241bfd37e17ac1a72567b92d18a396598da2099a908b3d88c590
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/elvish
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp elvish ${out}/bin/
{% endblock %}

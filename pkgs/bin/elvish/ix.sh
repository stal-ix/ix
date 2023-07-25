{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/elves/elvish/archive/refs/tags/v0.19.2.tar.gz
{% endblock %}

{% block go_sha %}
26869ee44f59ea0108b15ae5d733d5130662116f157dfdaa5b88b2d753e53350
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/elvish
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp elvish ${out}/bin/
{% endblock %}

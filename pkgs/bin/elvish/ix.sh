{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/elves/elvish/archive/refs/tags/v0.20.1.tar.gz
{% endblock %}

{% block go_sha %}
e04f0c476550d1f7fdf05749dbd550395410f79ad7697f5c75db77ef5c5a423f
{% endblock %}

{% block go_refine %}
find . -type l -delete
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/elvish
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp elvish ${out}/bin/
{% endblock %}

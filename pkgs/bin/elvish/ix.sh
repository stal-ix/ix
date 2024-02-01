{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/elves/elvish/archive/refs/tags/v0.19.2.tar.gz
{% endblock %}

{% block go_sha %}
59085e50898bf705438116b0474fae74e21101f46b4f325c43cc3b8bfe2eaddb
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

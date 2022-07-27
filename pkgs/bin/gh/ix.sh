{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/cli/cli/archive/refs/tags/v2.14.3.tar.gz
sha:b674f04ff9954564ba74488fc22817f5548bcddb5d9d582720d2421604988270
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gh ${out}/bin/
{% endblock %}

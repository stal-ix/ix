{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/cli/cli/archive/refs/tags/v2.14.4.tar.gz
{% endblock %}

{% block go_sha %}
5e692c28864ff5442bc89a3d35a1bf8be5baa139ae29ab11e3f531978d171dde
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gh ${out}/bin/
{% endblock %}

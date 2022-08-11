{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/cli/cli/archive/refs/tags/v2.14.4.tar.gz
sha:be93380e5a7f2822a1bfeff80f23231ee72ca297b9bc05bba0a1c688f9f53ccf
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gh ${out}/bin/
{% endblock %}

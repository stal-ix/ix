{% extends '//die/cgo.sh' %}

{% block fetch %}
https://github.com/cli/cli/archive/refs/tags/v2.14.2.tar.gz
sha:06c78f050127bba298d273f824887ab4544273862abbf109df0e1d4fcb1cd7e6
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gh ${out}/bin/
{% endblock %}

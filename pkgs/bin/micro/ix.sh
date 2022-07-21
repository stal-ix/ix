{% extends '//die/cgo.sh' %}

{% block fetch %}
https://github.com/zyedidia/micro/archive/refs/tags/v2.0.10.tar.gz
sha:d849751fcd70eba48bf3e15c3cc665f818fe77e5ac7819d0afe2123dc258aedc
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/micro
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp micro ${out}/bin/
{% endblock %}

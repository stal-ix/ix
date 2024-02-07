{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/rgburke/grv/archive/refs/tags/v0.3.2.tar.gz
{% endblock %}

{% block go_sha %}
80f9fe9210862dd7359a2fdead7513864d021a5f3d4bc7d54ce6f24e34d03680
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/grv
{% endblock %}

{% block bld_libs %}
lib/c
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp grv ${out}/bin/
{% endblock %}

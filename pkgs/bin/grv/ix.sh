{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/rgburke/grv/archive/refs/tags/v0.3.2.tar.gz
{% endblock %}

{% block go_sha %}
48350e65c1ceabfc27fb9f1d89bf7dabd10cdb43fe6ce993d0277901fba1e8c7
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

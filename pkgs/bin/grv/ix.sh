{% extends '//die/go/build.sh' %}

{% block version %}
0.3.2
{% endblock %}

{% block go_url %}
https://github.com/rgburke/grv/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e6c265b05f63fda30e4cbbe6c860d1e6bb22e861f3b835cf396c7d0a49bf8d74
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

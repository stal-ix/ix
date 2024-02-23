{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-look/archive/refs/tags/v0.2.4.tar.gz
{% endblock %}

{% block go_sha %}
4d074fb9280f7ebf49a227f0dff8eb5f3e3626d3b517cc780f965bf5c8dd1f81
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/make
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|/usr/|/|' -i Makefile
sed -e 's|"/usr/share|"/'${out}'/share|' -i tools.go
{% endblock %}

{% block install %}
mkdir bin
cp nwg-look bin/
make DESTDIR=${out} install
{% endblock %}

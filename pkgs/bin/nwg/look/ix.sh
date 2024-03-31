{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-look/archive/refs/tags/v0.2.4.tar.gz
{% endblock %}

{% block go_sha %}
718ae175227f7b119edfcc8343ee9bd24981267739b1f016aa9f363f3bcda495
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

{% block go_version %}
v3
{% endblock %}

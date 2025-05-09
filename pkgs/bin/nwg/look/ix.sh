{% extends '//bin/nwg/t/ix.sh' %}

{% block pkg_name %}
nwg-look
{% endblock %}

{% block version %}
1.0.5
{% endblock %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-look/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
cb9dc8994029e3588844572333122e13bf45bcd20848d2e122590e5b3a9f20fd
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

{% block go_tool %}
bin/go/lang/24
{% endblock %}

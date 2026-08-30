{% extends '//bin/nwg/t/ix.sh' %}

{% block pkg_name %}
nwg-look
{% endblock %}

{% block version %}
1.1.1
{% endblock %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-look/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b03e79c040554a963f9cf1f3e825ac7506f65d64f9ab8294051ee99528ac778a
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
bin/go/lang/26
{% endblock %}

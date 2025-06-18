{% extends '//bin/nwg/t/ix.sh' %}

{% block pkg_name %}
nwg-look
{% endblock %}

{% block version %}
1.0.6
{% endblock %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-look/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7a774199ec08dc102915f7011aebd946c046a0f5d16b2cad131f6af46a0eebcf
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

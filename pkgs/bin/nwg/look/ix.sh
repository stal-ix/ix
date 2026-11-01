{% extends '//bin/nwg/t/ix.sh' %}

{% block pkg_name %}
nwg-look
{% endblock %}

{% block version %}
1.2.1
{% endblock %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-look/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
a70e6849fc04d42019b3bcee1bc9059999036bcdbc57dd13cb692ef2348c0923
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

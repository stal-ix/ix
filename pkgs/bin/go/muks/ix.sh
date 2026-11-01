{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gomuks
{% endblock %}

{% block version %}
26.10
{% endblock %}

{% block go_url %}
https://github.com/tulir/gomuks/archive/refs/tags/v0.{{self.version().strip().replace('.', '')}}.0.tar.gz
{% endblock %}

{% block go_sha %}
4a532ffd07394f35f2eb7eee435438e92375d71c365192a18e08c2f9e1a55230
{% endblock %}

{% block bld_libs %}
lib/olm
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block unpack %}
{{super()}}
mkdir -p web/dist
touch web/dist/empty
cd cmd/gomuks
{% endblock %}

{% block go_tags %}
sqlite_fts5
{% endblock %}

{% block go_bins %}
gomuks
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

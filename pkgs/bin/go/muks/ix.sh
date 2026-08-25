{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gomuks
{% endblock %}

{% block version %}
26.08
{% endblock %}

{% block go_url %}
https://github.com/tulir/gomuks/archive/refs/tags/v0.{{self.version().strip().replace('.', '')}}.0.tar.gz
{% endblock %}

{% block go_sha %}
e2a157a6b3347a378168f09f27c25f5a462fe2955b6f94d8c243fc6b20e64b0a
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
bin/go/lang/26
{% endblock %}

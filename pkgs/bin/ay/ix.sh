{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/ay/archive/95ec4a2e1136591857f7f540bd6e39e5f4db3779.tar.gz
{% endblock %}

{% block go_sha %}
f7b8868bb051ee6b4c75dd51400d8a5e0c6f5e1998a8e1a5506ce6cd51e3bd08
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block bld_tool %}
bld/python
bld/re2c
{% endblock %}

{% block patch %}
base64 -d << EOF | patch -p1
{% include 'local-resources.patch/base64' %}
EOF
python3 dev/gen_service_tokens.py --out service_tokens_gen.go *.go
python3 dev/gen_densemap.py --out-dir .
for source in *.re; do
    re2go --no-generation-date --no-version "${source}" -o "${source%.re}_gen.go"
done
{% endblock %}

{% block go_build_flags %}
{{super()}}
-trimpath
-buildvcs=false
{% endblock %}

{% block build %}
export CGO_ENABLED=0
{{super()}}
{% endblock %}

{% block go_bins %}
ay
{% endblock %}

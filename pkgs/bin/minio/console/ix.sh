{% extends '//die/go/build.sh' %}

{% block pkg_name %}
console
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{# Upstream github.com/minio/console is gone (removed in 2025). Fetch
 # from Go's module proxy — same source tree at commit
 # 6625d54d6766a3d267546d190660755bf5bfc5fe, just packaged as a Go
 # module zip (github.com/minio/console@v1.3.0/... inside). The
 # go_refine block flattens that nesting back to src/ root. #}
{% block go_url %}
https://proxy.golang.org/github.com/minio/console/@v/v{{self.version().strip()}}.zip
{% endblock %}

{% block go_refine %}
(cd minio/console@v{{self.version().strip()}} && find . -mindepth 1 -maxdepth 1 -exec mv {} ../../ \;)
rmdir minio/console@v{{self.version().strip()}} minio
{% endblock %}

{% block go_sha %}
909719e46558bd0ef2594bdeebaef4c7f143a1eab7e9868732d594ec5a87e490
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/console
{% endblock %}

{% block go_bins %}
console
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/bin/console ${out}/bin/minio-console
{% endblock %}

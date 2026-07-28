{% extends '//die/go/build.sh' %}

{% block pkg_name %}
syncthing
{% endblock %}

{% block version %}
2.1.2
{% endblock %}

{% block go_url %}
https://github.com/syncthing/syncthing/releases/download/v{{self.version().strip()}}/syncthing-source-v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
ef46f4711eb25c25202d1837afe22b978b4a23a1fae5934bccc837ff401ef064
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/syncthing
{% endblock %}

{% block bld_libs %}
{{super()}}
{% if darwin %}
lib/darwin/framework/CoreServices
{% endif %}
{% endblock %}

{% block go_tags %}
noupgrade
{% endblock %}

{% block go_build_flags %}
{{super()}}
-trimpath
{# Go 1.25 requires macOS 12, whose Security framework provides this symbol. #}
-ldflags '-w -buildid= -X github.com/syncthing/syncthing/lib/build.Version=v{{self.version().strip()}} -X github.com/syncthing/syncthing/lib/build.Stamp=1782451360 -X github.com/syncthing/syncthing/lib/build.User=ix -X github.com/syncthing/syncthing/lib/build.Host=ix -X github.com/syncthing/syncthing/lib/build.Tags=noupgrade{% if darwin %} -extldflags=-Wl,-U,_SecTrustCopyCertificateChain{% endif %}'
{% endblock %}

{% block go_bins %}
syncthing
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block step_setup %}
{{super()}}
{% if darwin %}
export CGO_ENABLED=1
{% else %}
export CGO_ENABLED=0
{% endif %}
{% endblock %}

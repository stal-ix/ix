{% extends '//die/go/build.sh' %}

{% block pkg_name %}
senpai
{% endblock %}

{% block version %}
0.4.1
{% endblock %}

{% block go_url %}
https://git.sr.ht/~delthas/senpai/archive/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
c574f740fd8173e5ecfff7584f6721a63e0c75dda05b854c180cc8afd3d5657f
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.16|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/senpai
{% endblock %}

{% block go_bins %}
senpai
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

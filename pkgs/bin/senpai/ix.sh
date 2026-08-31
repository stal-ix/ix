{% extends '//die/go/build.sh' %}

{% block pkg_name %}
senpai
{% endblock %}

{% block version %}
0.5.0
{% endblock %}

{% block go_url %}
https://git.sr.ht/~delthas/senpai/archive/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7bea2eb865b27219d0afa328f677a0da1283bfe0a1020f63a865d6c0e097ffc1
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
bin/go/lang/26
{% endblock %}

{% extends '//die/go/build.sh' %}

{% block version %}
0.3.0
{% endblock %}

{% block go_url %}
https://git.sr.ht/~delthas/senpai/archive/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
47581757e313e23bc3ecf6434e200cbc7f2fbc9f581c711a065d937b3e7c3c0b
{% endblock %}

{% block go_refine %}
sed -e 's|go 1.16|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/senpai
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp senpai ${out}/bin/
{% endblock %}

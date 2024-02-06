{% extends '//die/go/build.sh' %}

{% block go_url %}
https://git.sr.ht/~delthas/senpai/archive/v0.3.0.tar.gz
{% endblock %}

{% block go_sha %}
c47dcb7b728285afdd1d866985517c528c654a49cebc27d137246bc909470317
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

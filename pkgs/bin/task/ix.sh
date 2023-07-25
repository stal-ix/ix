{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/go-task/task/archive/refs/tags/v3.14.0.tar.gz
{% endblock %}

{% block go_sha %}
f411491365121679766bab7bddac034847d81ed91c185ceeb67b8885d0b5a926
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/task
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp task ${out}/bin/
{% endblock %}

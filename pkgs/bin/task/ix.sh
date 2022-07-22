{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/go-task/task/archive/refs/tags/v3.14.0.tar.gz
sha:6d4036566ba94ad6217c064435ae275f26b504918259ee068c4e663276689d20
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/task
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp task ${out}/bin/
{% endblock %}

{% extends '//die/go/build.sh' %}

{% block pkg_name %}
miller
{% endblock %}

{% block version %}
6.13.0
{% endblock %}

{% block go_url %}
https://github.com/johnkerl/miller/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
fc454bb888d18117729d0e15e24c74f2a074d52781058e9d88a9ea3d58701458
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/mlr
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp mlr ${out}/bin/
{% endblock %}

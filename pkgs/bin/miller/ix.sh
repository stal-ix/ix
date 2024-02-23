{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/johnkerl/miller/archive/refs/tags/v6.11.0.tar.gz
{% endblock %}

{% block go_sha %}
0d53b133a20a7307213c6079285cca0de40808b392395e5340bb31ab51100655
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/mlr
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp mlr ${out}/bin/
{% endblock %}


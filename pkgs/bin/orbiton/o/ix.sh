{% extends '//die/go/build.sh' %}

{% block go_url %}
{% include '//bin/orbiton/g/ver.sh' %}
{% endblock %}

{% block go_sha %}
db6bf8150dcc29bd184f6113865b8eb2f56094675ebd7269dcec446f596797bb
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block unpack %}
{{super()}}
cd v2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp orbiton ${out}/bin/o
{% endblock %}

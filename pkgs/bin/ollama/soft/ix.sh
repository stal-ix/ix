{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/ollama/ollama/archive/refs/tags/v0.12.11.tar.gz
{% endblock %}

{% block go_sha %}
535ec11f747da8012d2420d1f7699218d36d20f56dadbc4895db57f10a2f423d
{% endblock %}

{% block go_bins %}
ollama
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block lib_deps %}
lib/shim/fake(lib_name=stdc++)
{% endblock %}

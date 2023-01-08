{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/google/pprof/archive/c488b8fa1db3fa467bf30beb5a1d6f4f10bb1b87.tar.gz
{% endblock %}

{% block go_sum %}
sem:f7eb2ed9ab7ce4b9e723d3a6f4144612df6d5c0488cab717cd8d47d433353552
{% endblock %}

{% block go_sha %}
sha:dd5ee2969ea1a284f79a9f9a2551616603ab1edd7306dea0e250303b84ec3034
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp pprof ${out}/bin/
{% endblock %}

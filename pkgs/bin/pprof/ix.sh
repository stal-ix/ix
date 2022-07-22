{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/google/pprof/archive/c488b8fa1db3fa467bf30beb5a1d6f4f10bb1b87.tar.gz
sem:f7eb2ed9ab7ce4b9e723d3a6f4144612df6d5c0488cab717cd8d47d433353552
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp pprof ${out}/bin/
{% endblock %}

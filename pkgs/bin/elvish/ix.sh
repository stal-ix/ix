{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/elves/elvish/archive/refs/tags/v0.19.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:f7a5bd9bcbc42fb894e94e90bd3a3a964a9dc488d39c4fe668d06688651f60e4
{% endblock %}

{% block go_sha %}
sha:192e41dd75d2effb9a532caf664ca627b1eff033551240ee0a37811fab3fdacd
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/elvish
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp elvish ${out}/bin/
{% endblock %}

{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/tsliwowicz/go-wrk/archive/095f3d71518ba13fcd5521ed6ee48baa9246b0dc.zip
{% endblock %}

{% block go_sha %}
a8dae71d53694eeef25ce53bfe9e5adfd670444ffc5d800c046d7e75ed22fe1c
{% endblock %}

{% block go_bins %}
go-wrk
{% endblock %}

{% block go_tool %}
bin/go/lang/21
{% endblock %}

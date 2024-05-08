{% extends '//bin/go/lang/20/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.22.3.tar.gz
sha:a6ec566a848966c33154bb7d7f13be593a13365de48f4cb599a3cfdc9779ecd7
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/21
{% endblock %}

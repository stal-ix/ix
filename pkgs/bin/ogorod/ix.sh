{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/ogorod/archive/9d715cb9be81d0c8825de5ad120bd9848b5c003d.tar.gz
{% endblock %}

{% block go_sha %}
6008a631dbde6e7976b1078ae10517e6ff82ba8f202f1c65a30ac2e7af53ca79
{% endblock %}

{% block go_bins %}
ogorod
{% endblock %}

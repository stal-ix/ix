{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/e87e33fc9d9522ae3ea81fef5195b3231a4d84b5.tar.gz
{% endblock %}

{% block go_sha %}
8bc5564f57cbbcc5f1b3cea955b704078c078b130474b91d23fbac63672c26ba
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}

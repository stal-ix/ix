{% extends '//bin/curl/full/ix.sh' %}

{% block fetch %}
https://github.com/curl/curl/archive/b7c0bd68ffc0778ce0440439ac317da5a0765931.zip
sha:2fab849e64d34db8d6b35621981788dc02b12c1c931594c36d13b9e31d81fcbf
{% endblock %}

{% block curl_http3 %}
lib/msh3
{% endblock %}

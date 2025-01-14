{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/gg/archive/9499cb7d4506596f99e7888bd97901b8d0579d8f.zip
{% endblock %}

{% block go_sha %}
1457b8b635ef0f2c2ced528bcb08b0122c90ac5619715822eb38292714d6c3b2
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gg ${out}/bin/ya
{% endblock %}

{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/muesli/duf/archive/refs/tags/v0.8.1.tar.gz
{% endblock %}

{% block go_sum %}
sha:ebc3880540b25186ace220c09af859f867251f4ecaef435525a141d98d71a27a
{% endblock %}

{% block go_sha %}
sha:1b6b6ef74c78b171cd8642bd8e2dd268c13d2c0141e2fcdf0423c93b8d763d47
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp duf ${out}/bin/
{% endblock %}

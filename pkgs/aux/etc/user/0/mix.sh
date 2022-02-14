{% extends '//mix/proxy.sh' %}

{% block bld_tool %}
bin/busybox/full
{% endblock%}

{% block install %}
cd ${out}; mkdir -p etc/passwd.d; cd etc/passwd.d

cat << EOF > user0
pg:$(echo | cryptpw -S 237364527348):10000:10000:none:/home/pg:/home/pg/.session
EOF
{% endblock %}

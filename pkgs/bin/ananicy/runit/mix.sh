{% extends '//mix/proxy.sh' %}

{% block run_deps %}
bin/runsrv
bin/ananicy
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/services/ananicy; cd etc/services/ananicy

cat << EOF > run
#!/bin/sh
exec srv ananicy ananicy-cpp --manualscanning -v -v start
EOF

chmod +x run
{% endblock %}

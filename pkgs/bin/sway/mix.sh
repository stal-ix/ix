{% extends '//bin/sway/orig/mix.sh' %}

{% block run_deps %}
bin/subreaper
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/bin
mv sway swaybin

cat << EOF > sway
#!/bin/sh
exec subreaper swaybin "\$@"
EOF

chmod +x sway
{% endblock %}

{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
cat << EOF > ${out}/bin/{{prog_name}}
#!/bin/sh
umount -a -r
sync
sync
exec ix_reboot {{prog_action}}
EOF
chmod +x ${out}/bin/*
{% endblock %}

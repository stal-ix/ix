{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/fix
cat << EOF > ${out}/fix/set-adwaita-symlink.sh
cd share/icons
rm -f default
ln -s Adwaita default
EOF
{% endblock %}

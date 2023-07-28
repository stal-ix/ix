{% extends '//lib/fuse/3/ix.sh' %}

{% block bld_libs %}
lib/udev
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
utils=true
udevrulesdir=${out}/lib/udev
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv sbin/* bin/
rm -rf sbin
{% endblock %}

{% block patch %}
cat << EOF > util/install_helper.sh
#!/usr/bin/env sh
EOF
chmod +x util/install_helper.sh
{% endblock %}

{% extends '//die/go/build.sh' %}

{% block pkg_name %}
portal
{% endblock %}

{% block go_url %}
https://github.com/impulse-desktop/portal/archive/refs/tags/2.tar.gz
{% endblock %}

{% block go_sha %}
bc9e3a1fb95dc527c331b8ed59b653212351aeb63012c64988bf8551893f42bc
{% endblock %}

{% block go_bins %}
portal
{% endblock %}

{% block install %}
mkdir -p ${out}/share/dbus-1/services
cat << EOF > ${out}/share/dbus-1/services/org.freedesktop.portal.Desktop.service
[D-BUS Service]
Name=org.freedesktop.portal.Desktop
Exec=/bin/sh -c "exec portal"
EOF
{{super()}}
{% endblock %}

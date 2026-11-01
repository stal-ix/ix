{% extends '//etc/services/runit/script/ix.sh' %}

{% block srv_user_prepare %}
# Arc needs at least 10240 descriptors. Set both limits before dropping root.
ulimit -n 65536
# This servant is the only owner of the mount. A FUSE mount left at
# /home/pg/{{arc_dir}} when it starts belongs to a dead arc (restart, crash),
# and the next arc mount refuses it as "badly mounted". Detach it while still
# root.
if grep -q ' /home/pg/{{arc_dir}} fuse' /proc/mounts; then
    umount -f /home/pg/{{arc_dir}} || umount -l /home/pg/{{arc_dir}}
fi
{{super()}}
{% endblock %}

{% block srv_command %}
exec /bin/pg-arc-mount {{arc_dir}}
{% endblock %}

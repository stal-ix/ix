{% extends '//die/hub.sh' %}

{% block pg_pubkey %}
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDGZ3aEKhxpG9JHG3uso/gUuUKe9NzHOXKAenZIDiDqqhFFB+4k4fon39mFwzQvFnWR0GourHJvDlwG/Whf7G1b1d7pBHv5pZBNbQXrtWhunXbJ17hH+7Pn/W2a9t4pHTqm8uOJaiYmMl1PkIDTtOXJZn9hktH2jL2oQQwQ2sRm0H98Z3qcDe8ukPUkECpiMFAyzl+1GiIo6eftPoQKD/gXE7sUCShgKWvXlYOF/hifR0IR3xPu3/GCvTRUY6TDVt/cyvihrL9BEc/Z656B7PlVqkvJIM2dIwZB2EeqhNdkl2epB/Q2FPprlcTHfSvTRZBsndJxtxTSDa8oj7KVmAghMPNuJjB8M0fgWbqHUs7I8kFomoBqSDnmlgF8H5FRI6/WmVRj0DoDFSUcCTs2CVVKvm94CogUIQxq1DbtQuHlt+e16T82nfp4LqBz89kHxzeZ+SPtYt8XbY42G7zGbvRt/HPGRYLvEYj9LbeFox9z5/eYS8cu11LyYENqou73KA0= pg@stalix
{% endblock %}

{% block run_deps %}
etc/tmpfs
set/stalix
set/pg/system/env
{% if pg_host != 'note' %}
set/pg/vpn
{% endif %}
bin/thingd
bin/kernel/7/0
bin/kernel/7/1
{% if pg_host == 'note' %}
bin/kernel/6/16
{% endif %}
bin/btrfs/progs
set/pg/system/hosts
set/pg/system/certs
set/pg/system/mesh
set/pg/system/thingd
set/pg/system/logovo
{% if pg_host != 'note' %}
set/pg/system/initrd
{% endif %}
bin/dropbear/runit(dropbear_flags=-p 192.168.100.{{67 if pg_host == 'note' else 64}}:22{% if pg_host == 'note' %} -s{% endif %})
etc/user/0(hash={{pg_hash}},user=pg,pubkey={{self.pg_pubkey().strip()}},login_shell=/ix/realm/pg/bin/bash)
{% endblock %}

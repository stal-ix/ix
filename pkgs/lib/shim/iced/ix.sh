{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/shim/iced/rt
lib/shim/iced/fakes
lib/shim/fake(lib_name=stdc++)
lib/shim/redir(from=fpu_control.h,to=fakes.h)
lib/shim/redir(from=bits/ioctls.h,to=fakes.h)
lib/shim/redir(from=gnu/libc-version.h,to=fakes.h)
lib/shim/redir(from=sys/sysctl.h,to=linux/sysctl.h)
{% endblock %}

{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if linux %}
# strange memory alloc failures with tcmalloc
bin/neovim/unwrap(lua_ver=jit,purec=musl/unwrap,libc=musl/pure)
{% else %}
bin/neovim/unwrap(lua_ver=jit)
{% endif %}
{% endblock %}

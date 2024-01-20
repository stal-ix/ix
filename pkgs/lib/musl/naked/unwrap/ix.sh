{% extends '//lib/musl/noalloc/ix.sh' %}

{% block bad_sym %}
stub_invalid_handle
stub_dladdr
stub_dlopen
stub_dlsym
dlclose
dlerror
dlinfo
dlopen
dladdr
dlsym
{% endblock %}

{% block install %}
{{super()}}
{% for x in ix.parse_list(self.bad_sym()) %}
llvm-objcopy --strip-symbol={{x}} ${out}/lib/libc.a
{% endfor %}
{% endblock %}

{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/pg83/dlopen/archive/refs/tags/v2.tar.gz
a868469f93379c5b89c7e8906f5f896f0b80bbc55032238954f0b38a9a55206d
{% endblock %}

{% block lib_deps %}
lib/c++/dispatch
{% endblock %}

{% block install %}
{{super()}}
{% if not mingw32 %}
mv ${out}/lib/libdl.a ${out}/lib/libdlstub.a
{% endif %}
{% endblock %}

{% block patch %}
sed -e 's|-std=c++20|-std=c++17|' -i Makefile
{% endblock %}

{% block env %}
export ac_cv_func_dlerror=yes
export ac_cv_func_dlopen=yes
export ac_cv_func_dlsym=yes
export ac_cv_func_dladdr=yes
export ac_cv_func_dlclose=yes
export ac_cv_lib_dl_dlerror=yes
export ac_cv_lib_dl_dlopen=yes
export ac_cv_lib_dl_dlsym=yes
export ac_cv_lib_dl_dladdr=yes
export ac_cv_lib_dl_dlclose=yes
export ac_cv_search_dlopen=-ldl
{% endblock %}

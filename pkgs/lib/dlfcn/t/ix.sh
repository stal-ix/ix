{% extends '//die/c/make.sh' %}

{% block lib_deps %}
lib/c++/dispatch
{% endblock %}

{% block install %}
{{super()}}
{% if not mingw32 %}
mv ${out}/lib/libdl.a ${out}/lib/libdlstub.a
{% endif %}
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

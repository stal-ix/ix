{% extends '//die/dl/fix.sh' %}

{% block export_symbols %}
amdgpu_cs_create_sem
amdgpu_cs_signal_sem
amdgpu_cs_wait_sem
amdgpu_cs_export_sem
amdgpu_cs_import_sem
amdgpu_cs_destroy_sem
amdgpu_create_bo_from_phys_mem
amdgpu_bo_remap_secure
amdgpu_query_private_aperture
amdgpu_query_shared_aperture
amdgpu_bo_get_phys_address
amdgpu_cs_reserved_vmid
amdgpu_cs_unreserved_vmid
amdgpu_cs_ctx_create3
{% endblock %}

{% block export_lib %}
drm_amdgpu
{% endblock %}

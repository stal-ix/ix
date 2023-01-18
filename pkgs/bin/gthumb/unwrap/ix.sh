{% extends '//bin/gthumb/stock/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/dlfcn
bld/librarian
{% endblock %}

{% block build %}
{{super()}}
cd ${tmp}/obj
rm -rf gthumb/test-*
cd extensions
for x in $(ls -A); do (
    cd ${x}
    patchns lib${x}.a ns${x}_
) done
for x in $(ls -A); do
    cat << EOF
${x} gthumb_extension_activate ns${x}_gthumb_extension_activate
${x} gthumb_extension_configure ns${x}_gthumb_extension_configure
${x} gthumb_extension_deactivate ns${x}_gthumb_extension_deactivate
${x} gthumb_extension_is_configurable ns${x}_gthumb_extension_is_configurable
EOF
done | dl_stubs > ../stubs.c
cd ..
cat << EOF > lst
extensions/bookmarks/libbookmarks.a.p/actions.c.o
extensions/bookmarks/libbookmarks.a.p/callbacks.c.o
extensions/cairo_io/libcairo_io.a.p/gth-image-saver-avif.c.o
extensions/cairo_io/libcairo_io.a.p/gth-image-saver-jpeg.c.o
extensions/cairo_io/libcairo_io.a.p/gth-image-saver-png.c.o
extensions/cairo_io/libcairo_io.a.p/gth-image-saver-tga.c.o
extensions/cairo_io/libcairo_io.a.p/gth-image-saver-tiff.c.o
extensions/cairo_io/libcairo_io.a.p/gth-image-saver-webp.c.o
extensions/catalogs/libcatalogs.a.p/actions.c.o
extensions/catalogs/libcatalogs.a.p/callbacks.c.o
extensions/catalogs/libcatalogs.a.p/gth-catalog.c.o
extensions/catalogs/libcatalogs.a.p/gth-file-source-catalogs.c.o
extensions/catalogs/libcatalogs.a.p/gth-organize-task.c.o
extensions/change_date/libchange_date.a.p/actions.c.o
extensions/change_date/libchange_date.a.p/callbacks.c.o
extensions/change_date/libchange_date.a.p/gth-change-date-task.c.o
extensions/comments/libcomments.a.p/actions.c.o
extensions/comments/libcomments.a.p/callbacks.c.o
extensions/comments/libcomments.a.p/gth-comment.c.o
extensions/comments/libcomments.a.p/gth-import-metadata-task.c.o
extensions/comments/libcomments.a.p/gth-metadata-provider-comment.c.o
extensions/contact_sheet/libcontact_sheet.a.p/actions.c.o
extensions/contact_sheet/libcontact_sheet.a.p/callbacks.c.o
extensions/contact_sheet/libcontact_sheet.a.p/gth-contact-sheet-creator.c.o
extensions/contact_sheet/libcontact_sheet.a.p/gth-contact-sheet-theme-dialog.c.o
extensions/contact_sheet/libcontact_sheet.a.p/gth-contact-sheet-theme.c.o
extensions/convert_format/libconvert_format.a.p/actions.c.o
extensions/convert_format/libconvert_format.a.p/callbacks.c.o
extensions/desktop_background/libdesktop_background.a.p/actions.c.o
extensions/desktop_background/libdesktop_background.a.p/callbacks.c.o
extensions/edit_metadata/libedit_metadata.a.p/actions.c.o
extensions/edit_metadata/libedit_metadata.a.p/callbacks.c.o
extensions/edit_metadata/libedit_metadata.a.p/gth-delete-metadata-task.c.o
extensions/edit_metadata/libedit_metadata.a.p/gth-edit-comment-dialog.c.o
extensions/edit_metadata/libedit_metadata.a.p/gth-edit-general-page.c.o
extensions/edit_metadata/libedit_metadata.a.p/gth-edit-metadata-dialog.c.o
extensions/edit_metadata/libedit_metadata.a.p/gth-edit-tags-dialog.c.o
extensions/edit_metadata/libedit_metadata.a.p/gth-tag-task.c.o
extensions/exiv2_tools/libexiv2_tools.a.p/exiv2-utils.cpp.o
extensions/exiv2_tools/libexiv2_tools.a.p/gth-edit-iptc-page.c.o
extensions/exiv2_tools/libexiv2_tools.a.p/gth-metadata-provider-exiv2.c.o
extensions/export_tools/libexport_tools.a.p/callbacks.c.o
extensions/file_manager/libfile_manager.a.p/actions.c.o
extensions/file_manager/libfile_manager.a.p/callbacks.c.o
extensions/file_manager/libfile_manager.a.p/gth-copy-task.c.o
extensions/file_manager/libfile_manager.a.p/gth-duplicate-task.c.o
extensions/file_manager/libfile_manager.a.p/gth-reorder-task.c.o
extensions/file_tools/libfile_tools.a.p/actions.c.o
extensions/file_tools/libfile_tools.a.p/callbacks.c.o
extensions/file_tools/libfile_tools.a.p/gth-curve-editor.c.o
extensions/file_tools/libfile_tools.a.p/gth-curve-preset-editor-dialog.c.o
extensions/file_tools/libfile_tools.a.p/gth-curve-preset.c.o
extensions/file_tools/libfile_tools.a.p/gth-curve.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-adjust-colors.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-adjust-contrast.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-color-picker.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-crop.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-curves.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-effects.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-flip.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-grayscale.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-mirror.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-redo.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-resize.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-rotate-left.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-rotate-right.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-rotate.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-save-as.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-save.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-sharpen.c.o
extensions/file_tools/libfile_tools.a.p/gth-file-tool-undo.c.o
extensions/file_tools/libfile_tools.a.p/gth-image-line-tool.c.o
extensions/file_tools/libfile_tools.a.p/gth-image-rotator.c.o
extensions/file_tools/libfile_tools.a.p/gth-points.c.o
extensions/file_tools/libfile_tools.a.p/gth-preview-tool.c.o
extensions/file_viewer/libfile_viewer.a.p/gth-file-viewer-page.c.o
extensions/find_duplicates/libfind_duplicates.a.p/actions.c.o
extensions/find_duplicates/libfind_duplicates.a.p/callbacks.c.o
extensions/find_duplicates/libfind_duplicates.a.p/gth-find-duplicates.c.o
extensions/find_duplicates/libfind_duplicates.a.p/gth-folder-chooser-dialog.c.o
extensions/image_print/libimage_print.a.p/actions.c.o
extensions/image_print/libimage_print.a.p/callbacks.c.o
extensions/image_print/libimage_print.a.p/gth-image-info.c.o
extensions/image_print/libimage_print.a.p/gth-image-print-job.c.o
extensions/image_print/libimage_print.a.p/gth-load-image-info-task.c.o
extensions/image_rotation/libimage_rotation.a.p/actions.c.o
extensions/image_rotation/libimage_rotation.a.p/callbacks.c.o
extensions/image_rotation/libimage_rotation.a.p/gth-reset-orientation-task.c.o
extensions/image_rotation/libimage_rotation.a.p/gth-transform-task.c.o
extensions/image_viewer/libimage_viewer.a.p/actions.c.o
extensions/image_viewer/libimage_viewer.a.p/callbacks.c.o
extensions/image_viewer/libimage_viewer.a.p/gth-image-histogram.c.o
extensions/image_viewer/libimage_viewer.a.p/gth-image-viewer-page-tool.c.o
extensions/image_viewer/libimage_viewer.a.p/gth-image-viewer-page.c.o
extensions/image_viewer/libimage_viewer.a.p/gth-image-viewer-task.c.o
extensions/image_viewer/libimage_viewer.a.p/gth-metadata-provider-image.c.o
extensions/importer/libimporter.a.p/gth-import-destination-button.c.o
extensions/importer/libimporter.a.p/gth-import-preferences-dialog.c.o
extensions/importer/libimporter.a.p/gth-import-task.c.o
extensions/importer/libimporter.a.p/utils.c.o
extensions/list_tools/liblist_tools.a.p/actions.c.o
extensions/list_tools/liblist_tools.a.p/callbacks.c.o
extensions/list_tools/liblist_tools.a.p/gth-script-editor-dialog.c.o
extensions/list_tools/liblist_tools.a.p/gth-script-file.c.o
extensions/list_tools/liblist_tools.a.p/gth-script-task.c.o
extensions/list_tools/liblist_tools.a.p/gth-script.c.o
extensions/photo_importer/libphoto_importer.a.p/actions.c.o
extensions/photo_importer/libphoto_importer.a.p/callbacks.c.o
extensions/red_eye_removal/libred_eye_removal.a.p/gth-file-tool-red-eye.c.o
extensions/rename_series/librename_series.a.p/callbacks.c.o
extensions/rename_series/librename_series.a.p/gth-rename-task.c.o
extensions/resize_images/libresize_images.a.p/actions.c.o
extensions/resize_images/libresize_images.a.p/callbacks.c.o
extensions/search/libsearch.a.p/actions.c.o
extensions/search/libsearch.a.p/callbacks.c.o
extensions/search/libsearch.a.p/gth-search-editor-dialog.c.o
extensions/search/libsearch.a.p/gth-search-editor.c.o
extensions/search/libsearch.a.p/gth-search-source-selector.c.o
extensions/search/libsearch.a.p/gth-search-source.c.o
extensions/search/libsearch.a.p/gth-search-task.c.o
extensions/search/libsearch.a.p/gth-search.c.o
extensions/selections/libselections.a.p/actions.c.o
extensions/selections/libselections.a.p/callbacks.c.o
extensions/selections/libselections.a.p/gth-file-source-selections.c.o
extensions/selections/libselections.a.p/gth-metadata-provider-selections.c.o
extensions/selections/libselections.a.p/gth-selections-manager.c.o
extensions/slideshow/libslideshow.a.p/actions.c.o
extensions/slideshow/libslideshow.a.p/callbacks.c.o
extensions/slideshow/libslideshow.a.p/gth-slideshow-preferences.c.o
extensions/slideshow/libslideshow.a.p/gth-slideshow.c.o
extensions/slideshow/libslideshow.a.p/gth-transition.c.o
extensions/terminal/libterminal.a.p/actions.c.o
extensions/terminal/libterminal.a.p/callbacks.c.o
extensions/bookmarks/libbookmarks.a.p/dlg-bookmarks.c.o
extensions/cairo_io/libcairo_io.a.p/preferences.c.o
extensions/catalogs/libcatalogs.a.p/dlg-add-to-catalog.c.o
extensions/catalogs/libcatalogs.a.p/dlg-catalog-properties.c.o
extensions/catalogs/libcatalogs.a.p/dlg-organize-files.c.o
extensions/change_date/libchange_date.a.p/dlg-change-date.c.o
extensions/comments/libcomments.a.p/dlg-comments-preferences.c.o
extensions/contact_sheet/libcontact_sheet.a.p/dlg-contact-sheet.c.o
extensions/contact_sheet/libcontact_sheet.a.p/dlg-image-wall.c.o
extensions/convert_format/libconvert_format.a.p/dlg-convert-format.c.o
extensions/edit_metadata/libedit_metadata.a.p/dlg-edit-metadata.c.o
extensions/find_duplicates/libfind_duplicates.a.p/dlg-find-duplicates.c.o
extensions/image_print/libimage_print.a.p/preferences.c.o
extensions/image_viewer/libimage_viewer.a.p/preferences.c.o
extensions/list_tools/liblist_tools.a.p/dlg-personalize-scripts.c.o
extensions/photo_importer/libphoto_importer.a.p/dlg-photo-importer-preferences.c.o
extensions/photo_importer/libphoto_importer.a.p/dlg-photo-importer.c.o
extensions/rename_series/librename_series.a.p/dlg-rename-series.c.o
extensions/resize_images/libresize_images.a.p/dlg-resize-images.c.o
extensions/search/libsearch.a.p/callbacks.c.o
extensions/slideshow/libslideshow.a.p/callbacks.c.o
extensions/slideshow/libslideshow.a.p/preferences.c.o
extensions/terminal/libterminal.a.p/dlg-terminal-preferences.c.o
extensions/cairo_io/libcairo_io.a.p/cairo-image-surface-avif.c.o
extensions/cairo_io/libcairo_io.a.p/cairo-image-surface-jpeg.c.o
extensions/cairo_io/libcairo_io.a.p/cairo-image-surface-jxl.c.o
extensions/cairo_io/libcairo_io.a.p/cairo-image-surface-png.c.o
extensions/cairo_io/libcairo_io.a.p/cairo-image-surface-tiff.c.o
extensions/cairo_io/libcairo_io.a.p/cairo-image-surface-webp.c.o
extensions/cairo_io/libcairo_io.a.p/cairo-image-surface-xcf.c.o
extensions/file_tools/libfile_tools.a.p/cairo-blur.c.o
extensions/file_tools/libfile_tools.a.p/cairo-effects.c.o
extensions/file_tools/libfile_tools.a.p/cairo-rotate.c.o
extensions/jpeg_utils/libjpeg_utils.a.p/jmemorydest.c.o
extensions/jpeg_utils/libjpeg_utils.a.p/jmemorysrc.c.o
extensions/jpeg_utils/libjpeg_utils.a.p/jpeg-info.c.o
extensions/jpeg_utils/libjpeg_utils.a.p/jpegtran.c.o
extensions/jpeg_utils/libjpeg_utils.a.p/transupp-62.c.o
extensions/file_tools/libfile_tools.a.p/meson-generated_.._file-tools-enum-types.c.o
extensions/image_rotation/libimage_rotation.a.p/rotation-utils.c.o
extensions/image_rotation/libimage_rotation.a.p/rotation-utils.c.o
extensions/edit_metadata/libedit_metadata.a.p/utils.c.o
extensions/contact_sheet/libcontact_sheet.a.p/meson-generated_.._contact-sheet-enum-types.c.o
EOF
cc -o gthumb.exe stubs.c $(find gthumb -type f -name '*.o') $(find extensions -type f -name '*.a') $(cat lst | sort | uniq)
{% endblock %}

{% block install %}
{{super()}}
cp ${tmp}/obj/gthumb.exe ${out}/bin/gthumb
{% endblock %}

def package(mix):
    return {
        'build': {
            'script': mix.files.build_py,
            'depends': [
                'shell/dash/minimal',
                'dev/lang/clang',
            ],
        },
    }

def package(mix):
    return {
        'build': {
            'script': mix.files.build_sh,
            'depends': [
                'shell/dash/minimal',
                'dev/lang/clang',
                'boot/final/env',
                'boot/final/python',
            ],
        },
    }

def _kind_toolchain_impl(ctx):
    toolchain = platform_common.ToolchainInfo(
        compiler = ctx.attr.compiler,
    )

    return [toolchain]

kind_toolchain = rule(
    _kind_toolchain_impl,
    attrs = {
        "compiler": attr.label(),
    },
)

def _kind_alias(ctx):
    toolchain = ctx.toolchains["//rules/tools/kind:kind_toolchain_type"]
    kind_path = toolchain.compiler.files_to_run.executable.path
    return [
        toolchain,
        platform_common.TemplateVariableInfo({
            "KIND": kind_path,
        }),
        DefaultInfo(
            runfiles = ctx.runfiles(transitive_files = toolchain.compiler.files),
            files = toolchain.compiler.files,
        ),
    ]

kind_alias = rule(
    implementation = _kind_alias,
    toolchains = ["//rules/tools/kind:kind_toolchain_type"],
)

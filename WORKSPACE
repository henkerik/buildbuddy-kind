workspace(
    name = "buildbuddy-kind",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file", "http_archive")


http_archive(
    name = "io_buildbuddy_buildbuddy_toolchain",
    sha256 = "e899f235b36cb901b678bd6f55c1229df23fcbc7921ac7a3585d29bff2bf9cfd",
    strip_prefix = "buildbuddy-toolchain-fd351ca8f152d66fc97f9d98009e0ae000854e8f",
    urls = ["https://github.com/buildbuddy-io/buildbuddy-toolchain/archive/fd351ca8f152d66fc97f9d98009e0ae000854e8f.tar.gz"],
)

load("@io_buildbuddy_buildbuddy_toolchain//:deps.bzl", "buildbuddy_deps")

buildbuddy_deps()

load("@io_buildbuddy_buildbuddy_toolchain//:rules.bzl", "buildbuddy")

buildbuddy(
    name = "buildbuddy_toolchain",
    container_image = "henkerik/ubuntu-rbe-minikube@sha256:8deacc8e5c3b8be34a83989645ba28dd85b78558bf6575760ce11c6309293c0d",
)

http_file(
    name = "kind_darwin_x86",
    downloaded_file_path = "kind",
    executable = True,
    sha256 = "bffd8fb2006dc89fa0d1dde5ba6bf48caacb707e4df8551528f49145ebfeb7ad",
    urls = ["https://github.com/kubernetes-sigs/kind/releases/download/v0.20.0/kind-darwin-amd64"],
)

http_file(
    name = "kind_darwin_aarch64",
    downloaded_file_path = "kind",
    executable = True,
    sha256 = "8df041a5cae55471f3b039c3c9942226eb909821af63b5677fc80904caffaabf",
    urls = ["https://github.com/kubernetes-sigs/kind/releases/download/v0.20.0/kind-darwin-arm64"],
)

http_file(
    name = "kind_linux_x86",
    downloaded_file_path = "kind",
    executable = True,
    sha256 = "513a7213d6d3332dd9ef27c24dab35e5ef10a04fa27274fe1c14d8a246493ded",
    urls = ["https://github.com/kubernetes-sigs/kind/releases/download/v0.20.0/kind-linux-amd64"],
)

http_file(
    name = "kind_linux_aarch64",
    downloaded_file_path = "kind",
    executable = True,
    sha256 = "639f7808443559aa30c3642d9913b1615d611a071e34f122340afeda97b8f422",
    urls = ["https://github.com/kubernetes-sigs/kind/releases/download/v0.20.0/kind-linux-arm64"],
)

register_toolchains(
    "//rules/tools/kind:kind_linux_x86_toolchain",
    "//rules/tools/kind:kind_linux_aarch64_toolchain",
    "//rules/tools/kind:kind_darwin_x86_toolchain",
    "//rules/tools/kind:kind_darwin_aarch64_toolchain",
)
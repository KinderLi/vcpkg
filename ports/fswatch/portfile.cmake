vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  URL git@github.com:KinderLi/fswatch.git # 1.17.1.1
  REF 7e2a4b22d3b4e794e4d99ed6e9bea23f9d318603
)

if ("${TARGET_TRIPLET}" MATCHES "osx$")
    set(VCPKG_LIBRARY_LINKAGE dynamic)
endif()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH share/${PORT})

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/lib/cmake"
    "${CURRENT_PACKAGES_DIR}/lib/cmake"
)

file(INSTALL ${CURRENT_PACKAGES_DIR}/bin/fswatch DESTINATION ${CURRENT_PACKAGES_DIR}/tools/fswatch)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin)


if (NOT "${TARGET_TRIPLET}" MATCHES "windows$")
    file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/libfswatch/c/windows)
endif()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/bin)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/fswatch RENAME copyright)

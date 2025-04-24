vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL git@github.com:KinderLi/disruptor-cpp.git
    REF 7352965e84f1093ab0191963ac1f46f0da9a222e
)

set(ARM64_OSX OFF)

if ("${TARGET_TRIPLET}" STREQUAL "arm64-osx")
    set(ARM64_OSX ON)
endif()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DCMAKE_BUILD_TYPE=release
        -DARM64_OSX=${ARM64_OSX}
)

set(VCPKG_POLICY_DLLS_WITHOUT_LIBS enabled)
set(VCPKG_POLICY_DLLS_WITHOUT_EXPORTS enabled)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

vcpkg_copy_pdbs()

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENCE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/disruptor-cpp RENAME copyright)

# !/bin/bash
blue "OxygenOS15 相机修复" "OxygenOS 15 Camera Fix"
rm -rf build/portrom/images/my_product/app/OplusCamera
rm -rf build/portrom/images/my_product/product_overlay/framework/com.oplus.camera.*.jar
echo "ro.vendor.oplus.camera.isSupportLumo=1" >> build/portrom/images/my_product/etc/bruce/build.prop
cp -rf $module_files/* build/portrom/images/

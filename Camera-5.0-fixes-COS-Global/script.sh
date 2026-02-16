# !/bin/bash
blue "ColorOS Global 15 相机修复" "ColorOS15 Global Camera Fix"
rm -rf build/portrom/images/my_product/app/OplusCamera
rm -rf build/portrom/images/my_product/product_overlay/framework/com.oplus.camera.*.jar
echo "ro.vendor.oplus.camera.isSupportLumo=1" >> build/portrom/images/my_product/etc/bruce/build.prop
unzip -o devices/${base_product_device}/camera5.0-fix_cos_global.zip -d build/portrom/images/
cp $module_files/* build/portrom/images/
#!/usr/bin/env sh

# [ -z "$AMDGPU_PP_OD_CLK" ] || [ -z "$AMDGPU_HWMON" ] || [ -z "$AMDGPU_POWERCAP" ] && {
#     amd_vendor="0x1002"

#     # Find AMD GPU
#     GPU_base="card"
#     GPU="card0"
#     i=1
#     while [ "$i" -ne 10 ] && [ ! "$(cat /sys/class/drm/$GPU/device/vendor)" = "$amd_vendor" ]; do
#         GPU="$GPU_base$i"
#         i=$((i + 1))
#     done

#     [ ! "$(cat /sys/class/drm/$GPU/device/vendor)" = "$amd_vendor" ] && exit 1

#     device_path="/sys/class/drm/$GPU/device"
#     pp_od_clk_voltage_path="$device_path/pp_od_clk_voltage"
#     pp_power_profile_mode_path="$device_path/pp_power_profile_mode"
#     power_dpm_force_performance_level_path="$device_path/power_dpm_force_performance_level"

#     # Find HWMON path
#     HWMON_base="hwmon"
#     HWMON="$HWMON_base"0
#     i=1
#     while [ "$i" -ne 10 ] && [ ! -d "$device_path/hwmon/$HWMON" ]; do
#         HWMON="$HWMON_base$i"
#         i=$((i + 1))
#     done

#     export AMDGPU_HWMON="$device_path/hwmon/$HWMON"
#     export AMDGPU_PP_OD_CLK="$pp_od_clk_voltage_path"
#     export AMDGPU_POWERCAP="$device_path/hwmon/$HWMON/power1_cap"
#     export AMDGPU_POWER_PROFILE_MODE="$pp_power_profile_mode_path"
#     export AMDGPU_POWER_DPM_FORCE_PERFORMANCE_LEVEL="$power_dpm_force_performance_level_path"
# }

apply_oc() {
    oc="$(echo "$1" | grep "^[^pc] ")"
    power_cap="$(echo "$1" | grep "^[^smp] " | cut -d ' ' -f 2)"
    power_profile="$(echo "$1" | grep "^[^smc] " | cut -d ' ' -f 2)"

    [ -n "$oc" ] && echo "$oc" >"$AMDGPU_PP_OD_CLK"
    [ -n "$power_cap" ] && echo "$power_cap""000000" >"$AMDGPU_POWERCAP"
    [ -n "$power_profile" ] && echo "manual" >"$AMDGPU_POWER_DPM_FORCE_PERFORMANCE_LEVEL" && echo "$power_profile" >"$AMDGPU_POWER_PROFILE_MODE"

    echo "c" >"$AMDGPU_PP_OD_CLK"
}

# Stock values for Sapphire Pulse RX 580 are
# OD_SCLK:
# 0:        300MHz        750mV
# 1:        600MHz        769mV
# 2:        900MHz        887mV
# 3:       1145MHz       1093mV
# 4:       1215MHz       1175mV
# 5:       1257MHz       1150mV
# 6:       1300MHz       1150mV
# 7:       1366MHz       1150mV
# OD_MCLK:
# 0:        300MHz        750mV
# 1:       1000MHz        825mV
# 2:       2000MHz        975mV
# OD_RANGE:
# SCLK:     300MHz       2000MHz
# MCLK:     300MHz       2250MHz
# VDDC:     750mV        1200mV

# Overclock
# echo "s 3 1145 1093" >"$AMDGPU_PP_OD_CLK"
# echo "s 4 1215 1175" >"$AMDGPU_PP_OD_CLK"
# echo "s 5 1257 1150" >"$AMDGPU_PP_OD_CLK"
# echo "s 6 1366 1150" >"$AMDGPU_PP_OD_CLK"
# echo "s 7 1400 1150" >"$AMDGPU_PP_OD_CLK"

# Undervolt gaming
# echo "s 3 1145 1093" >"$AMDGPU_PP_OD_CLK"
# echo "s 4 1215 1175" >"$AMDGPU_PP_OD_CLK"
# echo "s 5 1257 1000" >"$AMDGPU_PP_OD_CLK"
# echo "s 6 1300 1000" >"$AMDGPU_PP_OD_CLK"
# echo "s 7 1366 1000" >"$AMDGPU_PP_OD_CLK"
# echo "m 2 2000 900" >"$AMDGPU_PP_OD_CLK"

# Mining
# echo "s 3 1100 880" >"$AMDGPU_PP_OD_CLK"
# echo "s 4 1100 880" >"$AMDGPU_PP_OD_CLK"
# echo "s 5 1100 880" >"$AMDGPU_PP_OD_CLK"
# echo "s 6 1125 890" >"$AMDGPU_PP_OD_CLK"
# echo "s 7 1150 900" >"$AMDGPU_PP_OD_CLK"
# echo "m 2 2150 870" >"$AMDGPU_PP_OD_CLK"

# VRAM P-States
# echo "m 2 2000 900" >"$AMDGPU_PP_OD_CLK"

# Set compute mode for mining
# echo "manual" >"$AMDGPU_POWER_DPM_FORCE_PERFORMANCE_LEVEL"
# echo "5" >"$AMDGPU_POWER_PROFILE_MODE"

# Auto select power profile
# echo "auto" >"$AMDGPU_POWER_DPM_FORCE_PERFORMANCE_LEVEL"

# Set Max Power to 120W for mining
# [ -d "$AMDGPU_HWMON" ] && echo 120000000 >"$AMDGPU_POWERCAP"

# Apply
# echo "c" >"$AMDGPU_PP_OD_CLK"

mining="s 3 1100 880
s 4 1100 880
s 5 1100 880
s 6 1125 890
s 7 1150 900
m 2 2150 870
c 120
p 5"

apply_oc "$mining"

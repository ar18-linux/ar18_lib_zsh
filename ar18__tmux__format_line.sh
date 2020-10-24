

function _ar18__tmux__format_line(){


  # $1: Space available on line.
  # $2: Module for the left side.
  # $3: Module for the right side.
  # $4: Module for the middle.
  function ar18__tmux__format_line(){
    local module_separator="_"
    local module_separator_length=${#module_separator}
    local space_total="$1"
    local arg_count=${#@}
    local module_count=$((arg_count - 1))
    local ret=""
    if [[ "${arg_count}" == "0" ]]; then
      ret="[NO ARGS]"
    elif [[ "${module_count}" == "0" ]]; then
      ret="[NO MODULES]"
    elif [[ "${module_count}" -gt 3 ]]; then
      ret="[TOO MANY MODULES, MAX 3]"
    else
      #----------|----------|----------
      #---------------|---------------
      # -------------#########%%%########-------------
      local space_rest=$((space_total % module_count))
      local space_per_module=$((space_total / module_count))
      local space_first_module=$((space_per_module + space_rest))
      local module_1="$2${module_separator}"
      local module_1_formatted="$(ar18__tmux__format_module ${space_first_module} "${module_1}")"
      ret="${module_1_formatted}"
      if [[ ${module_count} == 2 ]]; then
        local module_2="$3"
        local module_2_formatted="$(ar18__tmux__format_module $((space_total - ${#ret})) "${module_2}")"
        local padding_1_length=$((space_total - ${#ret} - ${#module_2_formatted}))
        local padding_1=""
        if [[ ${padding_1_length} != 0 ]]; then
          padding_1="$(printf "${module_separator}%.0s" $(seq ${padding_1_length}))"
        fi
        ret="${ret}${padding_1}${module_2_formatted}"
      elif [[ ${module_count} == 3 ]]; then
        local module_2="$3"
        local module_2_formatted="$(ar18__tmux__format_module ${space_per_module} "${module_2}")"
        local module_3="$4${module_separator}"
        local space_module_3=$((space_total - ${#ret} - ${#module_2_formatted}))
        local module_3_formatted="$(ar18__tmux__format_module ${space_module_3} "${module_3}")"
        local padding_length_total=$((space_total - ${#ret} - ${#module_2_formatted} - ${#module_3_formatted}))
        local padding_rest=$((padding_length_total % 2))
        padding_1_length=$((padding_length_total / 2 + padding_rest))
        local padding_1=""
        if [[ ${padding_1_length} != 0 ]]; then
          padding_1="$(printf "${module_separator}%.0s" $(seq ${padding_1_length}))"
        fi
        padding_2_length=$((padding_length_total / 2))
        local padding_2=""
        if [[ ${padding_2_length} != 0 ]]; then
          padding_2="$(printf "${module_separator}%.0s" $(seq ${padding_2_length}))"
        fi
        ret="${ret}${padding_1}${module_3_formatted}${padding_2}${module_2_formatted}"
      fi
    fi
    #ar18__log__dbg "${arg_count}" $LINENO "${"$(readlink -f "${(%):-%x}" | awk -F/ '{print $(NF-1) "/" $NF}')"}"
    printf '%s' "${ret}"
  }


  local script_dir_${${(%):-%N}%%.*}
  local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"
  
  . "${(P)script_dir_func}/ar18__tmux__format_module.sh"
  
}


type ar18__tmux__format_line > /dev/null || _ar18__tmux__format_line

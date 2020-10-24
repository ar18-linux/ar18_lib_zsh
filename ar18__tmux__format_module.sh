

function _ar18__tmux__format_module(){


  # $1: Space available.
  # $2: Module.
  function ar18__tmux__format_module(){
    local placeholder=".."
    local placeholder_length=${#placeholder}
    local space_total="$1"
    # Make sure we have an integer.
    space_total=$((space_total / 1))
    local module="$2"
    #echo "module:$module"
    local module_length=${#module}
    local ret=""
    if [[ ${module_length} > ${space_total} ]]; then
      local divisor=2
      local module_rest=$((module_length % divisor))
      local module_calculated=$((module_length / divisor))
      local module_left_length=$((module_calculated + module_rest))
      #local module_right_length=${module_calculated}
      local module_left="${module:0:$module_left_length}"
      local module_right="${module:$module_left_length}"
      local diff=$((module_length + placeholder_length - space_total))
      local rest=$((diff % divisor))
      local diff_calculated=$((diff / divisor))
      local diff_left=$((diff_calculated + rest))
      local diff_right=${diff_calculated}
      #echo "fg:$((module_left_length - diff_left))"
      module_left="${module_left:0:$((module_left_length - diff_left))}"
      module_right="${module_right:$((diff_right))}"
      ret="${module_left}${placeholder}${module_right}"
    else
      ret="${module}"
    fi
    printf '%s' "${ret}"
  }


  #local script_dir_func="script_dir_${${(%):-%N}%%.*}"
  #local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"
  
  #. 
  
}


type ar18__tmux__format_module > /dev/null || _ar18__tmux__format_module

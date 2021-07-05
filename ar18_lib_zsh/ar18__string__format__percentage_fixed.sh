

function _ar18__string__format__percentage_fixed(){


  function ar18__string__format__percentage_fixed(){
    local str="$1"
    local fill_char=" "
    set +u
    local length="$2"
    set -u
    if [[ "${length}" == "" ]] || [[ "${length}" -lt "3" ]]; then
      length=3
    fi
    str="${str/,/.}"
    local str_temp=${str/./}
    if [[ "${str_temp}" == "${str}" ]]; then
      local diff=$((length - ${#str}))
      local padding=""
      if [[ ${diff} != 0 ]]; then
        padding="$(printf "${fill_char}%.0s" $(seq ${diff}))"
      fi
      printf '%s' "${padding}${str}"
      return
    fi
    local pre_dot="${str%.*}"
    local after_dot="${str/${pre_dot}./}"
    local pre_dot_len="${#pre_dot}"
    local ret=""
    ret="${pre_dot}"
    local diff=$((length - ${#ret} - 1))
    if [[ "${diff}" -le "0" ]]; then
      ret="${ret}"
    else
      local next_dec="${after_dot:${diff}:1}"
      if [[ "${next_dec}" -ge "5" ]]; then
        local prev_decimal=${after_dot:$((diff - 1)):1}
        prev_decimal=$((prev_decimal + 1))
        ret="${ret}.${after_dot:0:$((diff - 1))}${prev_decimal}"
      else
        ret="${ret}.${after_dot:0:${diff}}"
      fi
    fi
    printf '%s' "${ret}"
  }


  #local script_dir_func="script_dir_${${(%):-%N}%%.*}"
  #local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"
  
  #. 
  
}


type ar18__string__format__percentage_fixed > /dev/null || _ar18__string__format__percentage_fixed

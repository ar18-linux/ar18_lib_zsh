

function _ar18__file(){


  function ar18__file(){
    return
  }


  local script_dir_func="script_dir_${${(%):-%N}%%.*}"
  local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"

  . "${(P)script_dir_func}/ar18__file__replace.sh"
}


type ar18__file > /dev/null || _ar18__file

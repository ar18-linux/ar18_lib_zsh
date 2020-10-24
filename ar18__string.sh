

function _ar18__string(){


  function ar18__string(){
    return
  }


  local script_dir_func="script_dir_${${(%):-%N}%%.*}"
  local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"

  . "${(P)script_dir_func}/ar18__string__format.sh"
  
}


type ar18__string > /dev/null || _ar18__string



function _ar18__date_time(){


  function ar18__date_time(){
    return
  }
  
  local script_dir_func="script_dir_${${(%):-%N}%%.*}"
  local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"

  . "${(P)script_dir_func}/ar18__date_time__get_timestamp.sh"
  . "${(P)script_dir_func}/ar18__date_time__get_timestamp_file.sh"
  
}


type ar18__date_time > /dev/null || _ar18__date_time

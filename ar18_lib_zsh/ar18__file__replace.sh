#!/usr/bin/env zsh
# ar18


function _ar18__file__replace(){


  function ar18__file__replace(){
    local source="$1"
    local what="$2"
    local with="$3"
    local sep="@"
    sed -ri "s${sep}${what}${sep}$(echo "${with}" | tr '@' 'ж')${sep}g" "${source}"
    #sed -ri "s@<[!]--#MY_SNIPPET#-->@$(echo "${var}" | tr '@' 'ж')@" test.html
    cat "${source}" | tr 'ж' '@' > "${source}_new"
    mv "${source}_new" "${source}"
  }


  #local script_dir_func="script_dir_${${(%):-%N}%%.*}"
  #local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"
  
  #. 
  
}


type ar18__file__replace > /dev/null || _ar18__file__replace


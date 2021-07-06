#!/usr/bin/env zsh
# ar18


function _ar18__string__format__bytes_to_human(){


  function ar18__string__format__bytes_to_human(){
    
    local str="$1"
    local space="6"
    local temp_buf="3"
    local space_buffer=$((space - temp_buf))
    set +u
    local prefix="$2"
    set -u
    if (( "${prefix}" == "" )); then
      prefix="KB"
    elif (( "${prefix}" == "KB" )); then
      prefix="MB"
    elif (( "${prefix}" == "MB" )); then
      prefix="GB"
    elif (( "${prefix}" == "GB" )); then
      prefix="TB"
    elif (( "${prefix}" == "TB" )); then
      prefix="PB"
    fi
    local kbs="$((1.0 * str / 1000))"
    local str_temp="${kbs%.*}"
    local str_temp_len="${#str_temp}"
    if (( str_temp_len > space_buffer )); then
      string__format__bytes_to_human "${str_temp}" "${prefix}"
    else
      local after_dot="$(echo "${kbs}" | cut -d '.' -f2)"
      after_dot="${after_dot:0:1}"
      if (( "${after_dot}" != "" )); then
        str_temp="${str_temp}.${after_dot}"
      fi
      str_temp_len="${#str_temp}"
      space="$((space - str_temp_len))"
      local padding="$(printf ' %.0s' $(seq $space))"
      printf '%s' "${padding}${str_temp}${prefix}"
    fi
  }


  #local script_dir_func="script_dir_${${(%):-%N}%%.*}"
  #local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"
  
  #. 
  
}


type ar18__string__format__bytes_to_human > /dev/null || _ar18__string__format__bytes_to_human

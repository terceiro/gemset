_gemset()
{
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$(gemset commands)" -- "$word") )
  else
    local command="${COMP_WORDS[1]}"
    if [ "$command" = 'run' ]; then
      _command_offset 2
    else
      local completions="$(gemset completions "$command")"
      COMPREPLY=( $(compgen -W "$completions" -- "$word") )
    fi
  fi
} &&
complete -F _gemset -o default gemset

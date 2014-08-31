function fish_prompt

  if not set -q -g __fish_robbyrussell_functions_defined
    set -g __fish_robbyrussell_functions_defined
    function _git_branch_name
      echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
    end
    function _is_git_dirty
      echo (git status -s --ignore-submodules=dirty ^/dev/null)
    end
  end
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)
  set -l magenta (set_color magenta)
  set -l green (set_color green)
  set -l lambda "$magenta λ"
  set -l cwd $green(prompt_pwd)
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)
    set git_info "$blue($git_branch"
    if [ (_is_git_dirty) ]
      set git_info "$git_info$red!"
    end
    set git_info "$git_info$blue)"
  end
  echo -n -s $cwd $git_info $normal $lambda ' '
end
